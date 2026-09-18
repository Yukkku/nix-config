{ writeText, ... }: {
  matches = [ "https://developer.mozilla.org/*" ];
  css = writeText "custom.css" ''
    :root {
      --color-background-page: transparent !important;
      --color-background-primary: rgba(0 0 0 / 0.5) !important;
      --color-background-secondary: rgba(0 0 0 / 0.3) !important;
      --color-background-red: rgba(128 0 0 / 0.3) !important;
      --color-background-orange: rgba(128 64 0 / 0.3) !important;
      --color-background-yellow: rgba(128 128 0 / 0.3) !important;
      --color-background-green: rgba(0 128 0 / 0.3) !important;
      --color-background-blue: rgba(0 0 128 / 0.3) !important;
      --color-background-purple: rgba(128 0 128 / 0.3) !important;

      --baseline-bg: rgba(0 64 0 / 0.3) !important;
    }
    .navigation {
      --color-background-page: rgba(0 0 0 / 0.5) !important;
    }
  '';
}
