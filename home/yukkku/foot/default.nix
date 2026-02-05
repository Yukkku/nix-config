{ pkgs, ... }:
{
  home.packages = [ pkgs.nerd-fonts.hack ];
  programs.foot = {
    enable = true;
    settings = {
      main.font = "Hack Nerd Font:pixelsize=13.3";
      main.line-height = "16px";
      colors = {
        background = "000000";
        alpha = 0.7;
      };
    };
  };
}
