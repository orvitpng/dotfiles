{
  imports = [
    ./modules/dconf.nix
    ./modules/firefox.nix
    ./modules/games.nix
    ./modules/git.nix
    ./modules/vscode.nix
  ];

  programs.home-manager.enable = true;
  home = {
    username = "carter";
    homeDirectory = "/home/carter";

    stateVersion = "23.11";
  };
}
