{ pkgs, ... }:
{
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      swtpm.enable = true;
      ovmf = {
        packages = [
          (pkgs.OVMFFull.override {
            secureBoot = true;
            tpmSupport = true;
          }).fd
        ];
      };
    };
  };
  services = {
    spice-vdagentd.enable = true;
    spice-webdavd.enable = true;
  };

  programs.virt-manager.enable = true;
}
