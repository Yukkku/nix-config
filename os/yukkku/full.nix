{
  inputs,
  lib,
  config,
  ...
}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  users.users.yukkku = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "dialout"
    ]
    ++ lib.optionals config.networking.networkmanager.enable [ "networkmanager" ];
    initialPassword = "0";
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.users.yukkku = import ../../home/yukkku/full.nix;

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

  security.pam.services.swaylock = { };
}
