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
    hashedPassword = "$y$j9T$vdanPb3AxT/He6u9PhXxE/$bjQ6E94ZZDXGtYWH63To/xaj5nf4kADBTmKQuhhVKX/";
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit inputs; };

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];
}
