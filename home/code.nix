{ pkgs, ... }:
{
  home.packages = [ pkgs.neovim ];

  programs = {
    git = {
      enable = true;
      userName = "Carter Davis";
      userEmail = "carterd1016@gmail.com";
    };
    vscode = {
      enable = true;
      package = pkgs.vscodium;
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    fish.enable = true;
  };
}
