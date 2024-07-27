{ pkgs, ... }:
{
  home.packages = with pkgs; [
    keypunch
    prismlauncher
    steam
  ];
}
