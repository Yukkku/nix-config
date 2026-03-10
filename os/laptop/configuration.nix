_: {
  imports = [ ./hardware-configuration.nix ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "yukkku-laptop";
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  console.keyMap = "jp106";
  time.timeZone = "Asia/Tokyo";

  users.users.yukkku = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialPassword = "0";
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  hardware.graphics.enable = true;

  security.pam.services.swaylock = { };
  programs.dconf.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "25.11";
}
