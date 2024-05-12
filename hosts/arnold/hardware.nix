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

  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    open = true;
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/bced959e-c088-4114-900d-fdf2a5b89774";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/1AF9-FB8D";
      fsType = "vfat";
    };
    "/home" = {
      device = "/dev/disk/by-uuid/6c7cdf26-f692-47ab-a866-a60d3f390aa3";
      fsType = "ext4";
    };
  };
  swapDevices = [ { device = "/dev/disk/by-uuid/7f4b4820-1791-4db5-a36f-b546c635379d"; } ];

  nixpkgs.hostPlatform = "x86_64-linux";
}
