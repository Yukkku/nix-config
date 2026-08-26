{ writeText, ... }: {
  matches = [ "https://github.com/*" ];
  css = writeText "custom.css" ''
    :root {
      --bgColor-default: transparent !important;
      --bgColor-inset: transparent !important;
      --bgColor-muted: rgba(0 0 0 / 0.3) !important;
      --overlay-bgColor: rgba(0 0 0 / 0.5) !important;
      --button-default-bgColor-rest: rgba(0 0 0 / 0.3) !important;
      --button-default-bgColor-hover: rgba(0 0 0 / 0.5) !important;
      --button-default-bgColor-active: rgba(0 0 0 / 0.5) !important;
    }
    .markdown-body pre {
      background-color: transparent !important;
    }
  '';
}
