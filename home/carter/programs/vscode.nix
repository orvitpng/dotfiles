{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      github.copilot
      jnoortheen.nix-ide
      mvllow.rose-pine
    ];
    userSettings = {
      "workbench.tree.indent" = 40;
      "workbench.colorTheme" = "Rosé Pine";

      "git.path" = "${pkgs.git}/bin/git";
      # nix-ide
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "${pkgs.nil}/bin/nil";
    };
  };
}
