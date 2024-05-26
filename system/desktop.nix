{ pkgs, ... }:
{
  imports = [ ./network.nix ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

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
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  hardware.pulseaudio.enable = false;
}
