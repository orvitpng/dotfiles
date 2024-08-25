{ lib, ... }:
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
          configDir = "/mnt/jellyfin-config/";
        };
      };
    })
  ];
}
