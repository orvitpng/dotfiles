{ pkgs, lib, ... }:
{
  home.packages = [
    (pkgs.discord.override {
      withOpenASAR = true;
    })
  ];
}
