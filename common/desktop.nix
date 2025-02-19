{ pkgs, lib, ... }:
{
  boot = {
    plymouth.enable = true;
    loader.timeout = 0;
    kernelParams = [ "quiet" ];
    consoleLogLevel = 0;
    kernelModules = [ "sg" ]; # for makemkv
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    logitech.wireless = {
      enable = true;
      enableGraphical = true;
    };
  };

  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      excludePackages = [ pkgs.xterm ];
    };
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = true;
      pulse.enable = true;
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    printing = {
      enable = true;
      drivers = [ pkgs.cups-brother-hll3230cdw ];
    };
    gnome.core-utilities.enable = false;
  };
  environment.systemPackages = with pkgs; [
    amberol
    celluloid
    ghostty
    loupe
    nautilus
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "cups-brother-hll3230cdw" ];

  networking.networkmanager = {
    enable = true;
    wifi.macAddress = "stable-ssid";
  };
}
