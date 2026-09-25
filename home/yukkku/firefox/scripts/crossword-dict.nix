{ writeText, ... }: {
  matches = [ "https://cross.mas3.net/*" ];
  css = writeText "custom.css" ''
    :root {
      color-scheme: dark;
      --bg-color: transparent !important;
      --card-bg: rgba(0 0 0 / 0.3) !important;
      --border-color: #000 !important;
      --nav-bg: rgba(0 0 0 / 0.5) !important;
      --footer-bg: rgba(0 0 0 / 0.3) !important;
    }
  '';
}
