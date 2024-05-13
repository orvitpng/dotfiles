{ self, inputs, ... }:
{
  flake.nixosConfigurations =
    let
      inherit (inputs.nixpkgs.lib) nixosSystem;

      system = "${self}/system";

      inherit (import system) desktop;
    in
    {
      arnold = nixosSystem {
        modules =
          with inputs.nixos-hardware.nixosModules;
          [
            ./arnold
            "${system}/services/gnome.nix"

            common-pc
            common-pc-ssd
            common-cpu-amd
            common-gpu-nvidia-nonprime

            inputs.home-manager.nixosModules.default {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "bk";

                users.carter = import ../home/carter;
              };
            }
          ]
          ++ desktop;
      };
    };
}
