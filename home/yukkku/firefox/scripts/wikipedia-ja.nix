{ writeText, ... }: {
  matches = [ "https://ja.wikipedia.org/*" ];
  js = writeText "custom.js" ''
    document.cookie="jawikimwclientpreferences=skin-theme-clientpref-os"
  '';
  css = writeText "custom.css" ''
    :root {
      --background-color-base: transparent !important;
      --background-color-neutral-subtle: transparent !important;
      --background-color-interactive-subtle: transparent !important;
    }
  '';
}
