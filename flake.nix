{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    devshell.url = "github:numtide/devshell";
  };
  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        # ./hosts
        inputs.treefmt-nix.flakeModule
        inputs.devshell.flakeModule
      ];

      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      perSystem =
        { pkgs, ... }:
        {
          treefmt.programs = {
            # nix
            nixfmt.enable = true;
            statix.enable = true;
            deadnix.enable = true;
            # markdown
            mdformat.enable = true;
            # sh
            shfmt.enable = true;
            shellcheck.enable = true;
          };
          devshells.default.packages = [ pkgs.nixd ];
        };
    };
}
