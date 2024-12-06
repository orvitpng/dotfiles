{
  imports = [
    ./browser.nix
    ./code.nix
    ./discord.nix
    ./games.nix
    ./gnome.nix
    ./security.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "carter";
    homeDirectory = "/home/carter";

    stateVersion = "24.05";
  };
  programs.home-manager.enable = true;
}
