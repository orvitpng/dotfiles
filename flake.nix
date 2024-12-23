{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";

    flake-parts.url = "github:hercules-ci/flake-parts";
    sops-nix.url = "github:Mic92/sops-nix";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };
  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = with inputs; [
        ./hosts
        sops-nix.nixosModules.sops
        treefmt-nix.flakeModule
      ];

      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      perSystem =
        { pkgs, ... }:
        {
          devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [
              nixd
              sops
            ];
          };

          sops = {
            defaultSopsFile = ./static/secrets.yaml;
            defaultSopsFormat = "yaml";
          };

          treefmt.programs = {
            # nix
            nixfmt.enable = true;
            statix.enable = true;
            deadnix.enable = true;
            # sh
            shfmt.enable = true;
            shellcheck.enable = true;
            # markdown
            mdformat.enable = true;
          };
        };
    };
}
