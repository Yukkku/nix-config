_: {
  imports = [
    ../base.nix
    ./hardware-configuration.nix
    ../systemd-boot
    ../pipewire
    ../yukkku/full.nix
  ];

  networking.hostName = "yukkku-sub-laptop";
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  hardware.graphics.enable = true;

  programs.dconf.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "25.11";
}
