{
  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "usbhid"
    "usb_storage"
    "sd_mod"
    "sdhci_pci"
  ];

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/3e0f6306-2f0f-4016-add3-e8f8af2ac0a9";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/079E-13E0";
      fsType = "vfat";
    };
  };

  nixpkgs.hostPlatform = "x86_64-linux";
}
