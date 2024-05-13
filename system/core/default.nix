{ pkgs, lib, ... }:
{
  imports = [
    ./boot.nix
    ../programs/doas.nix
    ../programs/fish.nix
  ];

  zramSwap.enable = true;

  users.users.carter = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  system.stateVersion = lib.mkDefault "23.11";
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
}
