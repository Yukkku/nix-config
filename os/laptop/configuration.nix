{ pkgs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix

    ../base.nix
    ../systemd-boot
    ../pipewire
    ../network
    ../printer
    ../yukkku/full.nix
  ];

  networking.hostName = "yukkku-laptop";

  hardware.graphics.enable = true;

  services.fprintd = {
    enable = true;
    tod = {
      enable = true;
      driver = pkgs.libfprint-2-tod1-goodix;
    };
  };

  security.pam.services.polkit-1.fprintAuth = true;
  services.udev.packages = [ pkgs.libfido2 ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "libfprint-2-tod1-goodix"
    ];
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "25.11";
}
