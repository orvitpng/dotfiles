{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser-flake = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
