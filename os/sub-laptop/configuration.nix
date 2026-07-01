_: {
  imports = [
    ./hardware-configuration.nix
    ../pipewire
    ../yukkku/full.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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
