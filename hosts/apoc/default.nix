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

  services = {
    coredns = {
      enable = true;
      config = builtins.readFile ../../static/apoc_coredns.Corefile;
    };

    traefik = {
      enable = true;
      staticConfigOptions = {
        entryPoints = {
          web = {
            address = ":80";
            http.redirections.entryPoint = {
              to = "websecure";
              scheme = "https";
              permanent = true;
            };
          };
          websecure = {
            address = ":443";
            http.tls.certResolver = "letsencrypt";
          };
        };
        certificatesResolvers.letsencrypt.acme = {
          email = "postmaster@sonnygrace.net";
          storage = "${config.services.traefik.dataDir}/acme.json";
          httpChallenge.entryPoint = "web";
        };

        providers.docker.exposedByDefault = false;
      };
    };
  };
  users.users.traefik.extraGroups = [ "docker" ];

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
