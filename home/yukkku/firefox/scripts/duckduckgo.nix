{ writeText, ... }: {
  matches = [ "https://duckduckgo.com/*" ];
  css = writeText "custom.css" ''
    :root {
      --theme-col-bg-header: transparent !important;
      --sds-color-background-01: transparent !important;
      --theme-col-bg-page: transparent !important;
      --theme-col-bg-search: rgba(0 0 0 / 0.5) !important;
    }
    body, .site-wrapper, .header-wrap {
      background-color: transparent !important;
    }
  '';
}
