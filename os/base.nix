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
}
