{ pkgs, ... }:
{
  home.packages = with pkgs; [
    mullvad-vpn
    mullvad-closest
  ];
  programs = {
    gpg.enable = true;
    git.signing = {
      signByDefault = true;
      key = "6F94E77508115E37";
    };
    password-store = {
      enable = true;
      package = pkgs.pass.withExtensions (exts: [ exts.pass-otp ]);
    };
  };
}
