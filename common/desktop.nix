{
  boot = {
    plymouth.enable = true;
    loader.timeout = 0;
    kernelParams = [ "quiet" ];
    consoleLogLevel = 0;
    kernelModules = [ "sg" ]; # for makemkv
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    pulseaudio.enable = false;
  };
  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = true;
      pulse.enable = true;
    };
  };

  networking.networkmanager = {
    enable = true;
    wifi.macAddress = "stable-ssid";
  };
}
