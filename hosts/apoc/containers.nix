{
  virtualisation.oci-containers.containers = {
    media = {
      image = "linuxserver/jellyfin:latest";
      ports = [ "8000:8096" ];
      extraOptions = [ "--device=/dev/dri:/dev/dri" ];
      volumes = [
        "/mnt/.containers/media:/config"
        "/mnt/media:/mnt/media"
      ];
      environment = {
        TZ = "America/Chicago";
	JELLYFIN_PublishedServerUrl = "https://media.sonnygrace.net";
      };
    };
    cloud = {
      image = "linuxserver/nextcloud:latest";
      ports = [ "8001:80" ];
      volumes = [
        "/mnt/.containers/cloud/config:/config"
        "/mnt/.containers/cloud/data:/data"
        "/mnt/media:/mnt/media"
      ];
      environment = {
        TZ = "America/Chicago";
      };
    };
  };
}
