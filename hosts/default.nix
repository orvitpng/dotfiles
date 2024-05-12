{ self, inputs, ... }:
{
  flake.nixosConfigurations =
    let
      inherit (inputs.nixpkgs.lib) nixosSystem;

      hardware = inputs.nixos-hardware.nixosModules;

      system = "${self}/system";

      inherit (import system) desktop;
    in
    {
      arnold = nixosSystem {
        modules =
          with hardware;
          [
            common-pc
            common-pc-ssd
            common-cpu-amd
            common-gpu-nvidia-nonprime
          ]
          ++ [
            ./arnold
            "${system}/services/gnome.nix"
          ]
          ++ desktop;
      };
    };
}
