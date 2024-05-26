{ pkgs, ... }:
{
  imports = [ ./hardware.nix ];

  environment.systemPackages = [ pkgs.gnomeExtensions.supergfxctl-gex ];

  networking.hostName = "alice";
}
