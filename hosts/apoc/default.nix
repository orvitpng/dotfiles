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
    # TODO: automatically detect local ip, and also use CNAME instead of A record for *
    coredns = {
      enable = true;
      config = ''
                . {
        	  forward . 1.1.1.1 1.0.0.1
        	  template ANY ANY {
        	    match (.*\.)?sonnygrace\.net
        	    answer "{{ .Name }} 3600 IN A 192.168.0.16"
        	    fallthrough
        	  }
        	}
      '';
    };
    caddy = {
      enable = true;
      virtualHosts = lib.mkMerge [
        (proxy "media" 8000)
        (proxy "cloud" 8001)
      ];
    };
  };

  networking = {
    hostName = "apoc";
    hostId = "277d6a3a";

    firewall = {
      allowedTCPPorts = [
        22
        53
        80
        443
      ];
      allowedUDPPorts = [ 53 ];
    };
  };
}
