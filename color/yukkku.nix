{ ... }:
let
  makeColor = r: g: b: rec {
    inherit r g b;
    hex =
      let
        hexChar = v: builtins.substring v 1 "0123456789abcdef";
        toHex = v: (hexChar (v / 16)) + (hexChar (v - v / 16 * 16));
      in
      "${toHex r}${toHex g}${toHex b}";
    hashHex = "#" + hex;
    cssLike = "rgb(${toString r},${toString g},${toString b})";
  };
in
rec {
  black = makeColor 34 34 34;
  red = makeColor 234 71 71;
  green = makeColor 33 166 33;
  yellow = makeColor 146 146 0;
  blue = makeColor 117 117 255;
  magenta = makeColor 198 83 198;
  cyan = makeColor 0 172 172;
  white = makeColor 255 255 255;

  info = green;
  warn = yellow;
  error = red;
}
