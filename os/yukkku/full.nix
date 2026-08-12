_: {
  imports = [ ./base.nix ];
  home-manager.users.yukkku = import ../../home/yukkku/full.nix;

  security.pam.services.swaylock = { };
}
