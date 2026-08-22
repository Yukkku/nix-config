{ writeText, ... }: {
  matches = [ "https://github.com/*" ];
  css = writeText "custom.css" ''
    :root {
      --bgColor-default: transparent !important;
      --bgColor-inset: transparent !important;
      --bgColor-muted: rgba(0 0 0 / 0.5) !important;
      --overlay-bgColor: rgba(0 0 0 / 0.5) !important;
    }
  '';
}
