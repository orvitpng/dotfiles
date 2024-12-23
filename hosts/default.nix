{ self, inputs, ... }:
let
  inherit (inputs.nixos-hardware) nixosModules;

  common = "${self}/common";
  system =
    modules:
    inputs.nixpkgs.lib.nixosSystem {
      inherit modules;
      specialArgs = {
        inherit inputs;
      };
    };
in
{
  flake.nixosConfigurations = {
    arnold = system (
      with nixosModules;
      [
        ./arnold
        "${common}"
        "${common}/carter.nix"
        "${common}/desktop.nix"
        "${common}/ssh.nix"

        common-pc
        common-pc-ssd
        common-cpu-amd-pstate
      ]
    );
  };
}
