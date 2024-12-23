{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };
  users.users.root.openssh.authorizedKeys.keyFiles = [ ../static/authorized_keys ];
  networking.firewall.allowedTCPPorts = [ 22 ];
}
