{ ... }:
let
  mkColor = r: g: b: rec {
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
  black = mkColor 34 34 34;
  white = mkColor 255 255 255;

  red = mkColor 245 101 90;
  orange = mkColor 237 147 63;
  yellow = mkColor 219 196 52;
  green = mkColor 80 214 93;
  cyan = mkColor 33 213 228;
  blue = mkColor 101 119 252;
  magenta = mkColor 229 102 224;

  info = green;
  warn = yellow;
  error = red;
}
