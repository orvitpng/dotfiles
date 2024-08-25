{ config, lib, ... }:
{
  boot = {
    kernelPackages = lib.mkForce config.boot.zfs.package.latestCompatibleLinuxPackages;
    initrd.availableKernelModules = [
      "nvme"
      "ahci"
      "xhci_pci"
      "thunderbolt"
      "usb_storage"
      "sd_mod"
    ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/5f999881-5a12-4d9a-8591-b803c3f312bc";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/3E55-8721";
      fsType = "vfat";
    };
    "/mnt" = {
      device = "pool/data";
      fsType = "zfs";
    };
  };

  nixpkgs.hostPlatform = "x86_64-linux";
}
