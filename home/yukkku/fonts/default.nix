{ pkgs, ... }:
{
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    noto-fonts-monochrome-emoji
    jigmo
    hack-font
    nerd-fonts.hack
  ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "HackNerdFont" ];
    };
  };
}
