_: {
  imports = [
    ../base.nix
    ./hardware-configuration.nix
    ../systemd-boot
    ../pipewire
    ../network
    ../yukkku/full.nix
  ];

  networking.hostName = "yukkku-sub-laptop";

  hardware.graphics.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "25.11";
}
