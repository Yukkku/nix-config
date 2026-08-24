{ writeText, ... }: {
  matches = [ "https://turbowarp.org/*" ];
  css = writeText "custom.css" ''
    :root {
      --page-background: transparent !important;
      --ui-primary: transparent !important;
      --ui-secondary: transparent !important;
      --assets-background: transparent !important;
      --ui-tertiary: rgba(0 0 0 / 0.3) !important;
      --ui-white: rgba(0 0 0 / 0.3) !important;
      --menu-bar-background: rgba(0 0 0 / 0.5) !important;
    }
    .blocklySvg {
      background-color: transparent !important;
    }
    .blocklyToolboxDiv {
      background-color: rgba(0 0 0 / 0.5) !important;
      & > .scratchCategoryMenu {
        background-color: transparent !important;
      }
    }
    .blocklyFlyoutBackground {
      fill: rgba(0 0 0 / 0.5) !important;
    }
  '';
}
