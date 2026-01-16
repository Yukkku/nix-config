{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs =
    { nixpkgs, ... }:
    {
      nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
        modules = [ ./os/laptop/configuration.nix ];
      };
    };
}
