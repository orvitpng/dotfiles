{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neovim
    tree
  ];

  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
        golang.go
        jnoortheen.nix-ide
        signageos.signageos-vscode-sops
        ziglang.vscode-zig
      ];
      userSettings = {
        "workbench.tree.indent" = 32;

        # go
        "go.alternateTools" = {
          go = "${pkgs.go}/bin/go";
        };
        # nix-ide
        "nix.enableLanguageServer" = true;
        "nix.hiddenLanguageServerErrors" = [ "textDocument/definition" ];
        "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
        # signageos-vscode-sops
        "sops.binPath" = "${pkgs.sops}/bin/sops";
        # vscode-zig
        "zig.formattingProvider" = "off";
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
    nix-index.enable = true;
  };
}
