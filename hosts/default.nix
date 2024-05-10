{ self, inputs, ... }:
{
  flake.nixosConfigurations =
    let
      inherit (inputs.nixpkgs.lib) nixos;

      system = "${self}/system";
    in
    { };
}
