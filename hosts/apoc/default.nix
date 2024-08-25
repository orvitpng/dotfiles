{ config, lib, ... }:

let
  stdHost = host: container: port: {
    "${host}.sonnygrace.net".extraConfig = ''
      reverse_proxy ${config.containers.${container}.localAddress}:${toString port}
    '';
  };
in
{
  imports = [
    ./hardware.nix
    ./containers.nix
  ];

  networking = {
    hostName = "apoc";
    hostId = "277d6a3a";
    nat = {
      enable = true;
      internalInterfaces = [ "ve-+" ];
      externalInterface = "enp11s0";
    };
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
        443
      ];
    };
  };

  services.caddy = {
    enable = true;
    virtualHosts = lib.mkMerge [
      (stdHost "media" "media" 8096)
      (stdHost "cloud" "cloud" 80)
    ];
  };

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };
  users.users.carter.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDpZDvcpMX/wyZXu9VIetZPOIFkx4kI2Dte6VlHgG132 cdavis4short@gmail.com"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK8sUPGLU7+4ga5lGWeI4AsSx9I2vhEHy3bCRM8HUCui cdavis4short@gmail.com"
  ];
}
