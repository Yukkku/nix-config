{ writeText, ... }: {
  matches = [ "https://search.nixos.org/*" ];
  css = writeText "custom.css" ''
    :root {
      --background-color: transparent !important;
      --headerbar-background-color: transparent !important;

      --button-background: rgba(0 0 0 / 0.3) !important;
      --button-hover-background: rgba(0 0 0 / 0.5) !important;
      --button-active-background: rgba(0 0 0 / 0.5) !important;
      --button-active-hover-background: rgba(0 0 0 / 0.5) !important;
      --terminal-background: rgba(0 0 0 / 0.3) !important;
      --color-active-tab: rgba(0 0 0 / 0.3) !important;
      --color-active-hover-tab: rgba(0 0 0 / 0.5) !important;
    }
  '';
}
