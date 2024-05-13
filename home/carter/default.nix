{
  imports = [
    ./programs/dconf.nix
    ./programs/firefox.nix
    ./programs/git.nix
    ./programs/vscode.nix
  ];

  programs.home-manager.enable = true;
  home = {
    username = "carter";
    homeDirectory = "/home/carter";

    stateVersion = "23.11";
  };
}
