{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    yukkku-genicon = {
      url = "github:yukkku/yukkku-genicon";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      eachSystem = nixpkgs.lib.genAttrs [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];
    in
    {
      nixosConfigurations = rec {
        laptop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [ ./os/laptop/configuration.nix ];
        };
        yukkku-laptop = laptop;

        sub-laptop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [ ./os/sub-laptop/configuration.nix ];
        };
        yukkku-sub-laptop = sub-laptop;

        lab-wsl = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [ ./os/lab-wsl/configuration.nix ];
        };
        yukkku-lab-wsl = lab-wsl;
      };

      homeConfigurations = {
        yukkku-mini = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { system = "x86_64-linux"; };
          extraSpecialArgs = { inherit inputs; };
          modules = [ ./home/yukkku/mini.nix ];
        };
        yukkku-full = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { system = "x86_64-linux"; };
          extraSpecialArgs = { inherit inputs; };
          modules = [ ./home/yukkku/full.nix ];
        };
      };

      devShells = eachSystem (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default = pkgs.mkShellNoCC {
            packages = with pkgs; [
              nixd
              nixfmt
            ];
          };
        }
      );
    };
}
