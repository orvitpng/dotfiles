{
  virtualisation.oci-containers.containers = {
    media = {
      image = "jellyfin/jellyfin:latest";
      ports = [ "8000:8096" ];
      volumes = [
        "/mnt/.containers/media:/config"
        "/mnt/media:/mnt/media"
      ];
    };
    cloud = {
      image = "nextcloud:stable";
      ports = [ "8001:80" ];
      volumes = [
        "/mnt/.containers/cloud/data:/var/www/html/data"
        "/mnt/.containers/cloud/config:/var/www/html/config"
        "/mnt/.containers/cloud/apps:/var/www/html/apps"
        "/mnt/media:/mnt/media"
      ];
      environment = {
        OVERWRITEPROTOCOL = "https";
        TRUSTED_PROXIES = "172.17.0.1";
      };
    };
  };
}
