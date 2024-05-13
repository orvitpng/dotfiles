{ self, inputs, ... }:
{
  flake.nixosConfigurations =
    let
      inherit (inputs.nixpkgs.lib) nixosSystem;

      system = "${self}/system";

      desktop = [
        "${system}/core"

        inputs.home-manager.nixosModules.default
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "bk";

            users.carter = import ../home/carter;
          };
        }
      ];
      laptop = desktop ++ [ "${system}/services/power.nix" ];
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
          ]
          ++ desktop;
      };
      alice = nixosSystem {
        modules =
          with inputs.nixos-hardware.nixosModules;
          [
            ./alice
            "${system}/services/gnome.nix"

            asus-zephyrus-ga402
          ]
          ++ laptop;
      };
    };
}
