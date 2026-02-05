{ pkgs, ... }:
{
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = [ pkgs.fcitx5-skk ];
    fcitx5.settings.inputMethod = {
      GroupOrder = {
        "0" = "Default";
      };
      "Groups/0" = {
        Name = "Default";
        "Default Layout" = "jp";
        DefaultIM = "skk";
      };
      "Groups/0/Items/0" = {
        Name = "skk";
        Layout = "";
      };
    };
    fcitx5.settings.addons.skk.globalSection = {
      InitialInputMode = "Latin";
    };
  };
}
