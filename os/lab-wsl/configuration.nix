_: {
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  wsl.enable = true;
  wsl.defaultUser = "yukkku";

  networking.hostName = "yukkku-lab-wsl";

  time.timeZone = "Asia/Tokyo";

  users.users.yukkku = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialPassword = "0";
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "25.11";
}
