{
  games ? false,
}:
{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  nixpkgs.config.allowUnfree = true;

  users.users.carter = {
    isNormalUser = true;
    shell = pkgs.fish;
    # hashedPasswordFile = config.sops.secrets."passwords/carter".path;
    extraGroups = [ "wheel" ];
  };
  home-manager = {
    users.carter = (import ../home/carter) { inherit games; };
    extraSpecialArgs = { inherit inputs; };

    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bk";
  };

  services = {
    mullvad-vpn.enable = true;
    gnome.gnome-keyring.enable = lib.mkForce false;
    passSecretService.enable = true;
  };
  programs = {
    gamemode.enable = games;
    fish = {
      enable = true;
      interactiveShellInit = "set fish_greeting";
    };
  };
}
