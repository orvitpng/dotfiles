let
  background = "file://${./backgrounds/ducks.png}";
in
{
  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = background;
      picture-uri-dark = background;
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
    };
    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      speed = 0.5;
    };
    "org/gnome/desktop/screensaver".picture-uri = background;
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
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
    };
    "org/gnome/shell".favorite-apps = [
      "firefox.desktop"
      "armcord.desktop"
      "codium.desktop"
      "org.gnome.Nautilus.desktop"
      "org.gnome.Console.desktop"
    ];
  };
}
