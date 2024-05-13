{
  security = {
    doas = {
      enable = true;
      extraRules = [ { keepEnv = true ;} ];
    };
    sudo.enable = false;
  };
}
