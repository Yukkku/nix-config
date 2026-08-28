{ pkgs, config, ... }:
let
  fcitx5-skk' = pkgs.fcitx5-skk.override (prev: {
    libskk = prev.libskk.overrideAttrs (
      final: prev: { patches = (prev.patches or [ ]) ++ [ ./libskk.patch ]; }
    );
  });
in
{
  imports = [ ./myazik.nix ];
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = [ fcitx5-skk' ];
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
      CandidateChooseKey = "Qwerty Center Row (a,s,d,...)";
      Rule = "myazik";
    };
  };
  xdg.dataFile."fcitx5/skk/dictionary_list".text = ''
    type=file,file=${config.xdg.configHome}/libskk/dicts/local.dict,mode=readonly
    type=file,file=${pkgs.skkDictionaries.l}/share/skk/SKK-JISYO.L,mode=readonly
  '';
}
