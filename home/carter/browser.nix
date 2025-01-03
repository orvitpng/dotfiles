{ pkgs, ... }:
{
  home.packages = [ pkgs.fragments ];
  programs.firefox.enable = true;
}
