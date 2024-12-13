{ pkgs, config, ... }:
{
  virtualisation.oci-containers = {
    backend = "docker";
    containers = {
      proxy = {
        image = "jc21/nginx-proxy-manager:latest";
        ports = [
          "80:80"
          "443:443"
        ];
        environment = {
          PUID = "1000";
          PGID = "1000";
        };
        volumes = [
          "/mnt/.containers/proxy/data:/data"
          "/mnt/.containers/proxy/certs:/etc/letsencrypt"
        ];
        networks = [ "proxy" ];
        extraOptions = [
          "--sysctl"
          "net.ipv4.ip_unprivileged_port_start=80"
        ];
      };

      auth = {
        image = "lldap/lldap:latest";
        environment = {
          TZ = "America/Chicago";
          UID = "1000";
          GID = "1000";
        };
        volumes = [ "/mnt/.containers/auth:/data" ];
        networks = [
          "proxy"
          "auth"
        ];
      };
      books = {
        image = "linuxserver/calibre-web:latest";
        volumes = [
          "/mnt/.containers/books:/config"
          "/mnt/books:/books"
        ];
        environment = {
          TZ = "America/Chicago";
          PUID = "1000";
          PGID = "1000";
        };
        networks = [
          "proxy"
          "auth"
        ];
      };
    };
  };
  system.activationScripts.mkNetwork =
    let
      docker = config.virtualisation.oci-containers.backend;
      dockerBin = "${pkgs.${docker}}/bin/${docker}";
    in
    ''
      ${dockerBin} network create proxy || true
      ${dockerBin} network create auth || true
    '';

  users = {
    groups.services.gid = 1000;
    users.services = {
      group = "services";
      uid = 1000;
      isSystemUser = true;
    };
  };
  systemd.tmpfiles.rules = [
    "z /mnt 0755 services services -"
    "z /mnt/** 0755 services services -"
  ];
}
