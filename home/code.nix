{ pkgs, ... }:
{
  home.packages = [ pkgs.neovim ];

  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        rust-lang.rust-analyzer
        # signageos.signageos-vscode-sops
        tamasfe.even-better-toml
      ];
      userSettings = {
        "workbench.tree.indent" = 32;

        # even-better-toml
        "evenBetterToml.taplo.bundled" = false;
        "evenBetterToml.taplo.path" = "${pkgs.taplo}/bin/taplo";
        # nix-ide
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
        "nix.hiddenLanguageServerErrors" = [ "textDocument/definition" ];
        # rust-analyzer
        "rust-analyzer.cargo.sysroot" = "${pkgs.rustup}";
        # signageos-vscode-sops
        "sops.binPath" = "${pkgs.sops}/bin/sops";
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
