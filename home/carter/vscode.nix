{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      denoland.vscode-deno
      github.copilot
      gleam.gleam
      jnoortheen.nix-ide
      mvllow.rose-pine
      tamasfe.even-better-toml
      ziglang.vscode-zig
    ];
    userSettings = {
      "editor.fontFamily" = "JetBrainsMono Nerd Font";
      "editor.fontLigatures" = true;
      "editor.smoothScrolling" = true;
      "workbench.tree.indent" = 40;
      "workbench.colorTheme" = "Rosé Pine";

      "git.path" = "${pkgs.git}/bin/git";
      # vscode-deno
      "deno.enable" = true;
      "deno.path" = "${pkgs.deno}/bin/deno";
      # gleam
      "gleam.path" = "${pkgs.gleam}/bin/gleam";
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
