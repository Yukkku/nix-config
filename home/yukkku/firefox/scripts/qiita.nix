{ writeText, ... }: {
  matches = [ "https://qiita.com/*" ];
  css = writeText "custom.css" ''
    :root {
      --color-background: transparent !important;
      --color-surface: rgba(0 0 0 / 0.5) !important;
    }
  '';
}
