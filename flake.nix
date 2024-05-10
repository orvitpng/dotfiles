{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

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
