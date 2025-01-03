{ pkgs, ... }:
{
  home.packages = [ pkgs.neovim ];

  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        # signageos.signageos-vscode-sops
        ziglang.vscode-zig
      ];
      userSettings = {
        "workbench.tree.indent" = 32;

        # nix-ide
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
        "nix.hiddenLanguageServerErrors" = [ "textDocument/definition" ];
        # signageos-vscode-sops
        "sops.binPath" = "${pkgs.sops}/bin/sops";
        # vscode-zig
        "zig.path" = "${pkgs.zig}/bin/zig";
        "zig.zls.enabled" = "on";
        "zig.zls.path" = "${pkgs.zls}/bin/zls";
        #
      };
    };
    git = {
      enable = true;
      userName = "Carter Davis";
      userEmail = "carterd1016@gmail.com";
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
