{ writeText, ... }: {
  matches = [ "<all_urls>" ];
  css = writeText "custom.css" ''
    :root:has(body.rustdoc) {
      --main-background-color: transparent !important;
      --sidebar-background-color: transparent !important;
      --code-block-background-color: rgba(0 0 0 / 0.5) !important;
      & .docblock code {
        background-color: transparent !important;
      }
    }
  '';
}
