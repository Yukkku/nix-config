{ pkgs, ... }:
{
  home.packages = [ pkgs.hack-font ];
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      screenshots = true;
      effect-blur = "5x0";
      effect-vignette = "0.7:0.2";
      fade-in = 0.2;
      clock = true;
      font = "Hack";
      indicator = true;
      indicator-radius = 200;
      indicator-thickness = 20;

      inside-color = "000000b2";
      inside-clear-color = "000000b2";
      inside-ver-color = "000000b2";
      inside-wrong-color = "000000b2";

      line-color = "00000000";
      line-clear-color = "00000000";
      line-ver-color = "00000000";
      line-wrong-color = "00000000";

      ring-color = "ffffff";
      ring-clear-color = "ffff44";
      ring-ver-color = "4444ff";
      ring-wrong-color = "ff4444";

      text-color = "ffffff";
      text-clear-color = "ffffff";
      text-ver-color = "ffffff";
      text-wrong-color = "ffffff";

      separator-color = "00000000";
    };
  };
}
