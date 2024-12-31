{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };
  users.users.root.openssh.authorizedKeys.keys = import ../static/authorized_keys.nix;
  networking.firewall.allowedTCPPorts = [ 22 ];
}
