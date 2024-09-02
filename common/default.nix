{ pkgs, lib, ... }:
{
  system.stateVersion = "24.05";
  time.timeZone = lib.mkDefault "America/Chicago";
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "@wheel"
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  boot = {
    loader.systemd-boot.enable = true;
    kernelPackages = pkgs.linuxPackages_latest;

    plymouth.enable = true;
  };

  hardware.enableRedistributableFirmware = true;
  zramSwap.enable = true;
}
