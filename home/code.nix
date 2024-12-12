{ pkgs, ... }:
{
  home.packages = [
    pkgs.neovim
  ];

  programs = {
    git = {
      enable = true;
      userName = "Carter Davis";
      userEmail = "cdavis4short@gmail.com";
    };
    vscode = {
      enable = true;
      package = pkgs.vscodium;
    };
  };
}
