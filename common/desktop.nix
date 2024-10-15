{ pkgs, ... }:
{
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
      excludePackages = [ pkgs.xterm ];
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
  };

  networking.networkmanager = {
    enable = true;
    wifi = {
      powersave = true;
      macAddress = "stable-ssid";
      backend = "iwd";
    };
  };
}
