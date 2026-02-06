{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    { nixpkgs, home-manager, ... }:
    let
      eachSystem = nixpkgs.lib.genAttrs [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];
    in
    {
      nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
        modules = [ ./os/laptop/configuration.nix ];
      };
      homeConfigurations.yukkku-mini = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "x86_64-linux"; };
        modules = [ ./home/yukkku/mini.nix ];
      };
      homeConfigurations.yukkku-full = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "x86_64-linux"; };
        modules = [ ./home/yukkku/full.nix ];
      };
      devShells = eachSystem (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default = pkgs.mkShellNoCC {
            name = "typstenv";
            packages = with pkgs; [
              nixd
              nixfmt-rfc-style
            ];
          };
        }
      );
    };
}
