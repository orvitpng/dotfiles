{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      github.copilot
      jnoortheen.nix-ide
      mvllow.rose-pine
      ziglang.vscode-zig
    ];
    userSettings = {
      "workbench.tree.indent" = 40;
      "workbench.colorTheme" = "Rosé Pine";

      "git.path" = "${pkgs.git}/bin/git";
      # nix-ide
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "${pkgs.nil}/bin/nil";
      # vscode-zig
      "zig.initialSetupDone" = true;
      "zig.path" = "${pkgs.zig}/bin/zig";
      "zig.zls.path" = "${pkgs.zls}/bin/zls";
    };
  };
}
