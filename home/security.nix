{ pkgs, ... }:
{
  home.packages = [ pkgs.qtpass ];

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
  };

  programs.git.signing.key = "F4A7F0A1F0BEC431";
}
