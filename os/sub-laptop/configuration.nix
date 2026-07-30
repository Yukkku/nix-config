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
      ];
    };
  };

  networking.hostName = "yukkku-sub-laptop";

  hardware.graphics.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "26.11";
}
