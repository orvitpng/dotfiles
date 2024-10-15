{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neovim
  ];

  programs.git = {
    enable = true;
    userName = "Carter Davis";
    userEmail = "cdavis4short@gmail.com";
  };
}
