{
  imports = [
    ./browser.nix
    ./code.nix
    ./gnome.nix
    ./security.nix
  ];

  home = {
    username = "carter";
    homeDirectory = "/home/carter";

    stateVersion = "24.05";
  };
  programs.home-manager.enable = true;
}
