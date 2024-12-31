{
  # config,
  inputs,
  lib,
  pkgs,
  ...
}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  users.users.carter = {
    isNormalUser = true;
    shell = pkgs.fish;
    # hashedPasswordFile = config.sops.secrets."passwords/carter".path;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };
  home-manager.users.carter = import ../home;

  services = {
    mullvad-vpn.enable = true;
    gnome.gnome-keyring.enable = lib.mkForce false;
  };
  programs.fish = {
    enable = true;
    interactiveShellInit = "set fish_greeting";
  };
}
