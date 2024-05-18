{
  imports = [
    ./programs/dconf.nix
    ./programs/games.nix
    ./programs/git.nix
    ./programs/librewolf.nix
    ./programs/vscodium.nix
  ];

  programs.home-manager.enable = true;
  home = {
    username = "carter";
    homeDirectory = "/home/carter";

    stateVersion = "23.11";
  };
}
