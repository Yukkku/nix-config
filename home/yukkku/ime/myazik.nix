{ pkgs, lib, ... }:
let
  metadata = {
    name = "myazik";
    description = "";
  };
  latin = {
    define.keymap = {
      "Zenkaku_Hankaku" = "set-input-mode-hiragana";
    };
  };
  hiragana = {
    define.keymap = {
      "Zenkaku_Hankaku" = "set-input-mode-latin";
      "Henkan" = "next-candidate";
      "C-Henkan" = "previous-candidate";
      "\n" = "commit-unhandled";
      ${builtins.fromJSON "\"\\b\""} = "delete";
      "Hiragana_Katakana" = "set-input-mode-katakana";
    };
  };
  katakana = {
    define.keymap = {
      "Zenkaku_Hankaku" = "set-input-mode-latin";
      "Henkan" = "next-candidate";
      "C-Henkan" = "previous-candidate";
      "\n" = "commit-unhandled";
      ${builtins.fromJSON "\"\\b\""} = "delete";
      "Hiragana_Katakana" = "set-input-mode-hiragana";
    };
  };
  rom-kana =
    let
      c = a: i: u: e: o: {
        a = a;
        i = i;
        u = u;
        e = e;
        o = o;

        z = a + "ん";
        k = i + "ん";
        j = u + "ん";
        d = e + "ん";
        l = o + "ん";

        q = a + "い";
        h = u + "う";
        w = e + "い";
        p = o + "う";

        s = a + "っ";
        n = i + "っ";
        b = u + "っ";
        r = e + "っ";
        m = o + "っ";

        y = {
          a = i + "ゃ";
          u = i + "ゅ";
          o = i + "ょ";

          z = i + "ゃん";
          j = i + "ゅん";
          l = i + "ょん";

          q = i + "ゃい";
          h = i + "ゅう";
          p = i + "ょう";

          s = i + "ゃっ";
          b = i + "ゅっ";
          m = i + "ょっ";
        };
      };
      basic = {
        a = "あ";
        i = "い";
        u = "う";
        e = "え";
        o = "お";

        ";" = "っ";
        q = "ん";

        b = c "ば" "び" "ぶ" "べ" "ぼ";
        d = c "だ" "ぢ" "づ" "で" "ど";
        f = c "ふぁ" "ふぃ" "ふ" "ふぇ" "ふぉ";
        g = c "が" "ぎ" "ぐ" "げ" "ご";
        h = c "は" "ひ" "ふ" "へ" "ほ";
        j = c "じゃ" "じ" "じゅ" "じぇ" "じょ";
        k = c "か" "き" "く" "け" "こ";
        m = c "ま" "み" "む" "め" "も";
        n = c "な" "に" "ぬ" "ね" "の";
        p = c "ぱ" "ぴ" "ぷ" "ぺ" "ぽ";
        r = c "ら" "り" "る" "れ" "ろ";
        s = c "さ" "し" "す" "せ" "そ";
        t = c "た" "ち" "つ" "て" "と";
        v = c "ゔぁ" "ゔぃ" "ゔ" "ゔぇ" "ゔぉ";
        w = c "わ" "うぃ" "う" "うぇ" "を";
        y = c "や" "い" "ゆ" "いぇ" "よ";
        z = c "ざ" "じ" "ず" "ぜ" "ぞ";

        x = {
          a = "ぁ";
          i = "ぃ";
          u = "ぅ";
          e = "ぇ";
          o = "ぉ";
          ka = "ゕ";
          ke = "ゖ";
          tu = "っ";
          ya = "ゃ";
          yu = "ゅ";
          yo = "ょ";
          wa = "ゎ";
        };

        "-" = "ー";
        "~" = "〜";
        "[" = "「";
        "]" = "」";
        "." = ".";
        "," = ",";

        c = {
          ":" = lib.listToAttrs (
            map (
              v:
              let
                hex = lib.substring 1 4 (lib.toLower (lib.toHexString (v + 65536)));
              in
              {
                name = hex;
                value = builtins.fromJSON "\"\\u${hex}\"";
              }
            ) ((lib.range 1 55295) ++ (lib.range 57344 65535))
          );
        };
      };
    in
    {
      define.rom-kana = lib.listToAttrs (
        lib.mapAttrsToListRecursive (p: v: {
          name = lib.join "" p;
          value = [
            ""
            v
          ];
        }) basic
      );
    };
in
{
  xdg.configFile."libskk/rules/myazik".source = pkgs.runCommand "myazik" { } ''
    mkdir -p $out/keymap
    mkdir -p $out/rom-kana
    echo ${lib.escapeShellArg (lib.toJSON metadata)} > $out/metadata.json
    echo ${lib.escapeShellArg (lib.toJSON latin)} > $out/keymap/latin.json
    echo ${lib.escapeShellArg (lib.toJSON hiragana)} > $out/keymap/hiragana.json
    echo ${lib.escapeShellArg (lib.toJSON katakana)} > $out/keymap/katakana.json
    echo ${lib.escapeShellArg (lib.toJSON rom-kana)} > $out/rom-kana/default.json
  '';
}
