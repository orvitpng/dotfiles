{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };
  networking.firewall.allowedTCPPorts = [ 22 ];

  users.users.root.openssh.authorizedKeys.keyFiles = [ ../static/authorized_keys ];
}
