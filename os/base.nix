_: {
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  console.keyMap = "jp106";
  time.timeZone = "Asia/Tokyo";

  programs.nano.enable = false;
  programs.dconf.enable = true;

  users.mutableUsers = false;
}
