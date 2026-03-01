{ pkgs, ... }:
{
  programs.foot = {
    enable = true;
    settings = {
      main.font = "monospace:pixelsize=13.3";
      main.line-height = "16px";
      colors = {
        background = "000000";
        alpha = 0.7;
      };
    };
  };
}
