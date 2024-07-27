{ pkgs, ... }:
{
  imports = [ ./hardware.nix ];

  environment.systemPackages = [ pkgs.gnomeExtensions.gpu-supergfxctl-switch ];

  networking.hostName = "alice";
}
