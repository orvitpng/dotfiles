{ pkgs, ... }:
{
  boot = {
    loader.systemd-boot.enable = true;
    initrd = {
      systemd.enable = true;
      supportedFilesystems = [ "ext4" ];
    };
    consoleLogLevel = 3;

    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [ "quiet" ];

    plymouth.enable = true;
  };
}
