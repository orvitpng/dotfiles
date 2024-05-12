{ pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    initrd = {
      systemd.enable = true;
      supportedFilesystems = [ "ext4" ];
    };
    consoleLogLevel = 3;
    kernelParams = [ "quiet" ];

    plymouth.enable = true;
  };
}
