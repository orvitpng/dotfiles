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
            "${system}/virt.nix"

            common-pc
            common-pc-ssd
            common-cpu-amd
            common-gpu-nvidia-nonprime
          ]
          ++ default { carter = import ../home/carter; } { games = true; };
      };
      apoc = nixosSystem {
        modules = with inputs.nixos-hardware.nixosModules; [
          ./apoc
          "${system}/core"

          common-pc
          common-pc-ssd
          common-cpu-amd
        ];
      };
    };
}
