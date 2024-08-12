{ pkgs, ... }:
{
  imports = [ ./network.nix ];

  boot.kernelParams = [ "nouveau.config=NvGspRm=1" ];

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
    graphics = {
      enable = true;
      enable32Bit = true;
      # package = pkgs.mesa.drivers;
    };
    pulseaudio.enable = false;
  };
}
