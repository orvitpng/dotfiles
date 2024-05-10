{ self, inputs, ... }:
{
  flake.nixosConfigurations =
    let
      inherit (inputs.nixpkgs.lib) nixos;

      inherit (import "${self}/system") desktop;

      system = "${self}/system";
    in
    {
      arnold = nixos { modules = desktop; };
    };
}
