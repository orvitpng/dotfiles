{
  games ? false,
  ...
}:
{
  imports = [
    ./chrome.nix
    ./code.nix
    ./discord.nix
    ./fonts.nix
    ./gnome.nix
    ./writing.nix
  ] ++ (if games then [ ./games.nix ] else [ ]);

  home = {
    username = "carter";
    homeDirectory = "/home/carter";

    stateVersion = "23.11";
  };
  programs.home-manager.enable = true;
}
