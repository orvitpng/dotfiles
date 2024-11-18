{ inputs, pkgs, ... }:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  nixpkgs.config.allowUnfree = true;
  users.users.carter = {
    isNormalUser = true;
    shell = pkgs.fish;
    hashedPassword = "$y$j9T$hpS3IoSw4/3YdgVSW0ewj.$MOtSuPHWVYsAlgLNI6vFKR7QZhKECMNNXe0e9fNq/KA";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };
  home-manager.users.carter = import ../home;

  programs.fish = {
    enable = true;
    interactiveShellInit = "set fish_greeting";
  };
}
