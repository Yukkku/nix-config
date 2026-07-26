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

    brighten = mkColor ((r * 3 + 255) / 4) ((g * 3 + 255) / 4) ((b * 3 + 255) / 4);
  };
in
rec {
  black = mkColor 34 34 34;
  white = mkColor 255 255 255;

  red = mkColor 246 125 110;
  orange = mkColor 238 148 75;
  yellow = mkColor 219 196 59;
  green = mkColor 97 213 115;
  cyan = mkColor 26 212 228;
  blue = mkColor 125 149 254;
  magenta = mkColor 228 126 223;

  gray = mkColor 174 174 174;

  info = green;
  warn = yellow;
  error = red;
}
