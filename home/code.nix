{ pkgs, ... }:
{
  home.packages = [ pkgs.neovim ];

  programs = {
    git = {
      enable = true;
      userName = "Carter Davis";
      userEmail = "carter1016@gmail.com";
    };
    vscode = {
      enable = true;
      package = pkgs.vscodium;
    };
  };
}
