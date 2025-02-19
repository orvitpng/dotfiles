{ games }:
{
  lib,
  ...
}:
{
  imports = [
    ./ai.nix
    ./browser.nix
    ./code.nix
    ./gnome.nix
    ./security.nix
    ./games.nix
  ] ++ lib.optionals games [ ./games.nix ];

  home = {
    username = "carter";
    homeDirectory = "/home/carter";

    stateVersion = "24.11";
  };
}
