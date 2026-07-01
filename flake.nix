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
      nixos-wsl,
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
      nixosConfigurations.laptop =
        let
          system = "x86_64-linux";
        in
        nixpkgs.lib.nixosSystem {
          modules = [
            ./os/laptop/configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs system; };
              home-manager.users.yukkku = import ./home/yukkku/full.nix;

              environment.pathsToLink = [
                "/share/applications"
                "/share/xdg-desktop-portal"
              ];
            }
          ];
        };
      nixosConfigurations.sub-laptop =
        let
          system = "x86_64-linux";
        in
        nixpkgs.lib.nixosSystem {
          modules = [
            ./os/sub-laptop/configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs system; };
              home-manager.users.yukkku = import ./home/yukkku/full.nix;

              environment.pathsToLink = [
                "/share/applications"
                "/share/xdg-desktop-portal"
              ];
            }
          ];
        };
      nixosConfigurations.lab-wsl =
        let
          system = "x86_64-linux";
        in
        nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            nixos-wsl.nixosModules.default
            ./os/lab-wsl/configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs system; };
              home-manager.users.yukkku = import ./home/yukkku/mini.nix;

              environment.pathsToLink = [
                "/share/applications"
                "/share/xdg-desktop-portal"
              ];
            }
          ];
        };
      homeConfigurations.yukkku-mini =
        let
          system = "x86_64-linux";
        in
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };
          extraSpecialArgs = { inherit inputs system; };
          modules = [ ./home/yukkku/mini.nix ];
        };
      homeConfigurations.yukkku-full =
        let
          system = "x86_64-linux";
        in
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };
          extraSpecialArgs = { inherit inputs system; };
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
              nixfmt
            ];
          };
        }
      );
    };
}
