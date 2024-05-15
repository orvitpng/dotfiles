{ config, ... }:
{
  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "ahci"
    "usb_storage"
    "usbhid"
    "sd_mod"
    "sr_mod"
  ];

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    open = true;
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/d7cc9b26-95d3-4212-ae2b-2f393fe0e463";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/8916-D624";
      fsType = "vfat";
    };
    "/home" = {
      device = "/dev/disk/by-uuid/cc38df79-75e6-4526-b7e7-a7b9f5bf2e41";
      fsType = "ext4";
    };
  };

  nixpkgs.hostPlatform = "x86_64-linux";
}
