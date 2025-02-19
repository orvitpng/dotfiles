{
  # config,
  # inputs,
  lib,
  pkgs,
  ...
}:
{
  # imports = [ inputs.sops-nix.nixosModules.sops ];
  # sops = {
  #   defaultSopsFile = ../static/secrets/default.yaml;
  #   gnupg = {
  #     home = "/root/.gnupg";
  #     sshKeyPaths = [];
  #   };
  #   secrets = {
  #     "passwords/root" = { };
  #     "passwords/carter" = { };
  #   };
  # };
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

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
  system.stateVersion = "24.11";
  time.timeZone = lib.mkDefault "America/Chicago";

  users = {
    # users.root.hashedPasswordFile = config.sops.secrets."passwords/root".path;
    # mutableUsers = false;
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = lib.mkDefault pkgs.linuxPackages_zen;
    initrd.systemd.enable = true;
  };
  hardware.enableRedistributableFirmware = true;
  zramSwap.enable = true;
}
