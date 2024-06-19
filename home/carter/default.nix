{
  games ? false,
  ...
}:
{
  imports = [
    ./discord.nix
    ./firefox.nix
    ./git.nix
    ./gnome.nix
    ./idea.nix
    ./vscode.nix
  ] ++ (if games then [ ./games.nix ] else [ ]);

  home = {
    username = "carter";
    homeDirectory = "/home/carter";

    stateVersion = "23.11";
  };
  programs.home-manager.enable = true;
}
