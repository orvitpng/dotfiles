{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zed-editor

    neovim
    git
    zig
    gleam
    flyctl
  ];

  programs.git = {
    enable = true;
    userName = "Carter Davis";
    userEmail = "cdavis4short@gmail.com";
  };
}
