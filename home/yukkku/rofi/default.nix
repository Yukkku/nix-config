{ config, lib, ... }: {
  programs.rofi = {
    enable = true;
    extraConfig = {
      sort = true;
    };
    theme =
      let
        color = import ../color;

        inherit (config.lib.formats.rasi) mkLiteral;
        rgba =
          r: g: b: a:
          mkLiteral "rgb(${toString r},${toString g},${toString b},${toString a})";
        fromColor = c: mkLiteral "rgb(${toString c.r},${toString c.g},${toString c.b})";
        transparent = mkLiteral "transparent";
      in
      {
        "*" = {
          background-color = transparent;
          text-color = fromColor color.white;
          font = "monospace 10";
          spacing = 0;
        };
        window = {
          background-color = rgba 0 0 0 0.5;
          children = [
            "inputbar"
            "message"
            "listview"
          ];
        };
        inputbar = {
          background-color = rgba 0 0 0 0.3;
          children = [
            "prompt"
            "textbox-colon"
            "entry"
          ];
        };
        textbox-colon = {
          expand = false;
          str = ":";
          margin = mkLiteral "0 1ch 0 0";
        };
        element = {
          children = [
            "element-icon"
            "element-text"
          ];
        };
        "element.urgent" = {
          text-color = fromColor color.error;
        };
        "element.active" = {
          text-color = fromColor color.info;
        };
        "element.selected" = {
          text-color = fromColor color.yellow;
        };
        element-icon = {
          size = mkLiteral "2ch";
          margin = mkLiteral "0 1ch 0 0";
        };
        element-text = {
          text-color = mkLiteral "inherit";
        };
      };
  }
  // (
    if config.programs.foot.enable then { terminal = lib.getExe config.programs.foot.package; } else { }
  );
}
