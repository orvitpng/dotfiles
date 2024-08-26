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
          {
            networking.useHostResolvConf = lib.mkForce false;
            services.resolved.enable = true;

            hardware.graphics.enable = true;
          }
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
      bindMounts."/mnt/app" = {
        hostPath = "/mnt/media";
        isReadOnly = false;
      };
      extraConfig = {
        services.jellyfin = {
          enable = true;
          openFirewall = true;
          dataDir = "/mnt/app/jellyfin-data/";
        };
        system.activationScripts.setPermissions = ''
          chown -R jellyfin:jellyfin /mnt/app
        '';
      };
    })
    (stdContainer {
      name = "cloud";
      addr = "192.168.100.101";
      bindMounts = {
        "/mnt/app" = {
          hostPath = "/mnt/cloud";
          isReadOnly = false;
        };
        "/mnt/media" = {
          hostPath = "/mnt/media/media";
          isReadOnly = false;
        };
      };
      extraConfig = (
        { config, ... }:
        {
          services.nextcloud = {
            enable = true;
            hostName = "cloud.sonnygrace.net";
            home = "/mnt/app/nextcloud-data";
            config.adminpassFile = "/mnt/app/nextcloud-adminpass";

            extraApps = {
              inherit (config.services.nextcloud.package.packages.apps) tasks;
            };
            extraAppsEnable = true;
          };
          system.activationScripts.setPermissions = ''
            chown -R nextcloud:nextcloud /mnt/app
          '';

          networking.firewall.allowedTCPPorts = [ 80 ];
        }
      );
    })
  ];
}
