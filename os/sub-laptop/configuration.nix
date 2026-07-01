_: {
  imports = [
    ./hardware-configuration.nix
    ../systemd-boot
    ../pipewire
    ../yukkku/full.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.hostName = "yukkku-sub-laptop";
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  console.keyMap = "jp106";
  time.timeZone = "Asia/Tokyo";

  hardware.graphics.enable = true;

  programs.dconf.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "25.11";
}
