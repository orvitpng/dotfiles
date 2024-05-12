{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      imports = [ ./hosts ];

      perSystem =
        { pkgs, ... }:
        {
          devShells.default = pkgs.mkShell { packages = [ pkgs.nil ]; };
          formatter = pkgs.nixfmt-rfc-style;
        };
    };
}
