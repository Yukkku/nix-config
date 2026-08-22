{ writeText, ... }: {
  matches = [ "https://x.com/*" ];
  css = writeText "custom.css" ''
    body, .r-kemksi {
      background-color: transparent !important;
    }
  '';
}
