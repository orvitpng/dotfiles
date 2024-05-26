{ self, inputs, ... }:
{
  flake.nixosConfigurations =
    let
      inherit (inputs.nixpkgs.lib) nixosSystem;

      system = "${self}/system";

      default = users: extraSpecialArgs: [
        "${system}/core"

        inputs.home-manager.nixosModules.default
        {
          home-manager = {
            inherit extraSpecialArgs users;

            useGlobalPkgs = true;
            useUserPackages = true;
          };
        }
      ];
    in
    {
      arnold = nixosSystem {
        modules =
          with inputs.nixos-hardware.nixosModules;
          [
            ./arnold
            "${system}/desktop.nix"

            common-pc
            common-pc-ssd
            common-cpu-amd
            common-gpu-nvidia-nonprime
          ]
          ++ default { carter = import ../home/carter; } { games = true; };
      };
      alice = nixosSystem {
        modules =
          with inputs.nixos-hardware.nixosModules;
          [
            ./alice
            "${system}/desktop.nix"
            "${system}/battery.nix"

            asus-zephyrus-ga402
          ]
          ++ default { carter = import ../home/carter; } { games = false; };
      };
    };
}
