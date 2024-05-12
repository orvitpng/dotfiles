{ self, inputs, ... }:
{
  flake.nixosConfigurations =
    let
      inherit (inputs.nixpkgs.lib) nixosSystem;

      inherit (import "${self}/system") desktop;

      system = "${self}/system";
    in
    {
      arnold = nixosSystem { modules = desktop; };
    };
}
