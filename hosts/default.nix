{ self, inputs, ... }:
let
  inherit (inputs.nixpkgs.lib) nixosSystem;
  inherit (inputs.nixos-hardware) nixosModules;

  common = "${self}/common";
in
{
  flake.nixosConfigurations = {
    apoc = nixosSystem {
      modules = with nixosModules; [
        ./apoc
        "${common}"
        "${common}/ssh.nix"
        "${common}/zfs.nix"

        common-pc
        common-pc-ssd
        common-cpu-amd
        common-gpu-amd
      ];
    };
  };
}
