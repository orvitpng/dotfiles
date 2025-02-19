{pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    apostrophe
    fractal
    fragments

    inputs.zen-browser-flake.packages."${pkgs.system}".default
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
    };
  };
}
