{ writeText, ... }: {
  matches = [ "https://zenn.dev/*" ];
  css = writeText "custom.css" ''
    :root {
      --c-bg-base: transparent !important;
      --c-bg-base-outer: transparent !important;
      --c-bg-base-inner: transparent !important;
      --c-bg-emoji: rgba(0 0 0 / 0.3) !important;
      --c-bg-neutral: rgba(0 0 0 / 0.3) !important;
      --c-bd-code: rgba(0 0 0 / 0.3) !important;
      --c-form-input-bg-lighter: rgba(0 0 0 / 0.3) !important;
      --c-bg-primary-lighter: rgba(0 0 0 / 0.3) !important;
    }
    .znc pre {
      background-color: rgba(0 0 0 / 0.3) !important;
    }
  '';
}
