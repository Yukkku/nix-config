{ lib, ... }: {
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  console.keyMap = "jp106";
  time.timeZone = "Asia/Tokyo";

  programs.nano.enable = false;
  programs.dconf.enable = true;
  environment.defaultPackages = lib.mkDefault [ ];

  users.mutableUsers = false;

  networking.nameservers = [ "1.1.1.1" "1.0.0.1" ];
  networking.networkmanager.dns = "none";
}
