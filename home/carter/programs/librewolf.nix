{
  programs.librewolf = {
    enable = true;
    settings = {
      "privacy.clearOnShutdown.downloads" = false;
      "privacy.clearOnShutdown.history" = false;
      "privacy.resistFingerprinting" = false;
      "webgl.disabled" = false;
    };
  };
}
