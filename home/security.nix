{ pkgs, ... }:
{
  home.packages = [ pkgs.qtpass ];

  programs = {
    gpg.enable = true;
    git.signing = {
      signByDefault = true;
      key = "6F94E77508115E37";
    };
  };
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };

}
