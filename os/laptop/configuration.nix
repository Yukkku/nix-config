{
  inputs,
  lib,
  config,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    inputs.impermanence.nixosModules.impermanence

    ../base.nix
    ../systemd-boot
    ../pipewire
    ../network
    ../printer
    ../yukkku/full.nix
  ];

  environment.persistence."/persist" = {
    enable = true;
    directories = [
      "/var/lib/nixos"
    ]
    ++ lib.optionals config.networking.networkmanager.enable [
      "/etc/NetworkManager/system-connections"
    ];
    files = [ "/etc/machine-id" ];
    users.yukkku = {
      directories = [
        ".ssh"
        "repos"
        ".config/mozilla/firefox"
      ];
      files = [
        ".config/mypass/masterpass"
        ".config/libskk/dicts/local.dict"
      ];
    };
  };

  networking.hostName = "yukkku-laptop";

  hardware.graphics.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "25.11";
}
