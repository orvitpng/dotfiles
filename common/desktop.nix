{ pkgs, ... }:
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
    pulseaudio.enable = false;
  };

  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
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
    gnome.core-utilities.enable = false;
  };
  programs.firefox = {
    enable = true;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };
  };
  environment.systemPackages = with pkgs; [
    amberol
    celluloid
    ghostty
    loupe
    nautilus
  ];

  networking.networkmanager = {
    enable = true;
    wifi.macAddress = "stable-ssid";
  };
}
