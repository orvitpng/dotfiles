{ pkgs, ... }:
{
  programs = {
    vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        github.copilot
        jnoortheen.nix-ide
      ];
      userSettings = {
        "workbench.tree.indent" = 40;
        "git.path" = "${pkgs.git}/bin/git";

        # nix-ide
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "${pkgs.nil}/bin/nil";
      };
    };
    home-manager.enable = true;
  };

  home = {
    username = "carter";
    homeDirectory = "/home/carter";
    packages = with pkgs; [ firefox ];

    stateVersion = "23.11";
  };
}
