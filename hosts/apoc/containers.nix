{ pkgs, lib, ... }:
let
  stdContainer =
    {
      name,
      addr,
      bindMounts ? { },
      extraConfig ? { },
    }:
    {
      ${name} = {
        autoStart = true;
        privateNetwork = true;
        hostAddress = "192.168.100.10";
        config = lib.mkMerge [
          { hardware.graphics.enable = true; }
          extraConfig
        ];
        localAddress = addr;
        inherit bindMounts;
      };
    };
in
{
  containers = lib.mkMerge [
    (stdContainer {
      name = "media";
      addr = "192.168.100.100";
      bindMounts."/mnt" = {
        hostPath = "/mnt/media";
        isReadOnly = false;
      };
      extraConfig = {
        services.jellyfin = {
          enable = true;
          openFirewall = true;
          dataDir = "/mnt/jellyfin-data/";
        };
      };
    })
    (stdContainer {
      name = "cloud";
      addr = "192.168.100.101";
      bindMounts."/mnt" = {
        hostPath = "/mnt/cloud";
        isReadOnly = false;
      };
      extraConfig = ({config, ...}: {
        services.nextcloud = {
          enable = true;
          hostName = "cloud.sonnygrace.net";
          home = "/mnt/nextcloud-data";
          config.adminpassFile = "/mnt/nextcloud-adminpass";

          extraApps = {
            inherit (config.services.nextcloud.package.packages.apps) memories;
          };
          extraAppsEnable = true;
        };

        networking.firewall.allowedTCPPorts = [ 80 ];
      });
    })
  ];
}
