{
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./containers.nix
    ./hardware.nix
  ];

  boot.kernelPackages = lib.mkForce pkgs.linuxPackages;

  services.coredns = {
    enable = true;
    config = builtins.readFile ../../static/apoc_coredns.Corefile;
  };

  networking = {
    hostName = "apoc";
    hostId = "277d6a3a";
    firewall = {
      allowedTCPPorts = [
        53
        80
        443
      ];
      allowedUDPPorts = [ 53 ];
    };
  };
}
