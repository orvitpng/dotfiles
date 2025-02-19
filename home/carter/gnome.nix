{
  dconf.settings = {
    "org/gnome/desktop/app-folders/folders/Utilities".excluded-apps = [ "org.gnome.Loupe.desktop" ];
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
    };
    "org/gnome/desktop/media-handling".autorun-never = false;
    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      speed = 0.5;
    };
    "org/gnome/desktop/session".idle-delay = 0;
    "org/gnome/desktop/wm/keybindings" = {
      switch-applications = [ ];
      switch-applications-backward = [ ];
      switch-windows = [ "<Alt>Tab" ];
      switch-windows-backward = [ "<Shift><Alt>Tab" ];
    };
    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
      workspaces-only-on-primary = true;
    };
    "org/gnome/settings-daemon/plugins/power".sleep-inactive-ac-type = "nothing";
    "org/gnome/shell".favorite-apps = [
      "zen.desktop"
      "org.gnome.Nautilus.desktop"
      "com.mitchellh.ghostty.desktop"
      "codium.desktop"
    ];
  };
}
