{ lib, pkgs, ... }:

let
  proxy = host: port: {
    "${host}.sonnygrace.net".extraConfig = ''
      reverse_proxy :${toString port}
    '';
  };
in
{
  imports = [
    ./containers.nix
    ./hardware.nix
  ];

  boot.kernelPackages = lib.mkForce pkgs.linuxPackages;

  services = {
    coredns = {
      enable = true;
      config = import ../../static/apoc-coredns.nix;
    };
    caddy = {
      enable = true;
      virtualHosts = lib.mkMerge [
        (proxy "media" 8000)
      ];
    };
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
