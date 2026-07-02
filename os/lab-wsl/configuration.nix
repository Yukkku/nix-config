{ inputs, ... }: {
  imports = [
    inputs.nixos-wsl.nixosModules.default

    ../base.nix
    ../yukkku/mini.nix
  ];

  wsl.enable = true;
  wsl.defaultUser = "yukkku";

  networking.hostName = "yukkku-lab-wsl";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "25.11";
}
