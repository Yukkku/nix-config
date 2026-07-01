{ inputs, ... }: {
  imports = [
    inputs.nixos-wsl.nixosModules.default
    ../yukkku/mini.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  wsl.enable = true;
  wsl.defaultUser = "yukkku";

  networking.hostName = "yukkku-lab-wsl";

  time.timeZone = "Asia/Tokyo";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "25.11";
}
