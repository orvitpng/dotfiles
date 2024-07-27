{ pkgs, ... }:
{
  boot = {
    loader.systemd-boot.enable = true;
    initrd = {
      systemd.enable = true;
      supportedFilesystems = [ "ext4" ];
    };
    consoleLogLevel = 3;

    kernelPackages = pkgs.linuxPackages_6_6;
    kernelParams = [ "quiet" ];

    plymouth.enable = true;
  };
}
