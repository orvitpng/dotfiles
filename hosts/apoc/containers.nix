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
  };
}
