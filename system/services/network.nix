{
  networking.networkmanager = {
    enable = true;
    dns = "systemd-resolved";
    wifi = {
      powersave = true;
      macAddress = "stable";
      backend = "iwd";
    };
  };
}
