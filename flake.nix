{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    home-manager.url = "github:nix-community/home-manager";
    sops-nix.url = "github:Mic92/sops-nix";

    flake-parts.url = "github:hercules-ci/flake-parts";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };
  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = with inputs; [
        ./hosts
        treefmt-nix.flakeModule
      ];

      systems = [ "x86_64-linux" ];
      perSystem =
        { pkgs, ... }:
        {
          devShells.default = pkgs.mkShell {
            buildInputs = [ pkgs.sops ];
          };

          treefmt.programs = {
            # nix
            nixfmt.enable = true;
            statix.enable = true;
            deadnix.enable = true;
            # yaml
            yamlfmt.enable = true;
            # sh
            shfmt.enable = true;
            shellcheck.enable = true;
            # markdown
            mdformat.enable = true;
          };
        };
    };
}
