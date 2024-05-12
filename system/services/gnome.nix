{ pkgs, ... }:
{
  imports = [
    ./network.nix
    ./pipewire.nix
  ];

  services.xserver = {
    enable = true;
    excludePackages = [ pkgs.xterm ];
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
}
