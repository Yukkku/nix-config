_: {
  programs.foot = {
    enable = true;
    settings = {
      main.font = "monospace:pixelsize=13.3";
      main.line-height = "16px";
      colors-dark =
        let
          color = import ../color;
        in
        {
          background = "000000";
          alpha = 0.7;
          regular0 = color.black.hex;
          regular1 = color.red.hex;
          regular2 = color.green.hex;
          regular3 = color.yellow.hex;
          regular4 = color.blue.hex;
          regular5 = color.magenta.hex;
          regular6 = color.cyan.hex;
          regular7 = color.white.hex;

          bright0 = color.black.brighten.hex;
          bright1 = color.red.brighten.hex;
          bright2 = color.green.brighten.hex;
          bright3 = color.yellow.brighten.hex;
          bright4 = color.blue.brighten.hex;
          bright5 = color.magenta.brighten.hex;
          bright6 = color.cyan.brighten.hex;
          bright7 = color.white.brighten.hex;

        };
    };
  };
}
