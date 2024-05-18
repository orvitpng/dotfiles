{
  imports = [ ./hardware.nix ];

  virtualisation.containers.enable = true;

  networking.hostName = "arnold";
}
