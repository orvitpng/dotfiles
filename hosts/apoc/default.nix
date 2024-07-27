{
  imports = [ ./hardware.nix ];

  networking = {
    hostName = "apoc";
    hostId = "277d6a3a";
  };

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };
  users.users.carter.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDpZDvcpMX/wyZXu9VIetZPOIFkx4kI2Dte6VlHgG132 cdavis4short@gmail.com"
  ];

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 ];
  };
}
