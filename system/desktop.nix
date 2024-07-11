{ pkgs, ... }:
{
  imports = [ ./network.nix ];

  services = {
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
      pulse.enable = true;
    };
    gnome.gnome-browser-connector.enable = true;
  };
  hardware = {
    graphics.enable = true;
    pulseaudio.enable = false;
  };
}
