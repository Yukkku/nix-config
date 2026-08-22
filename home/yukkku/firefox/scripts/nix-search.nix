{ writeText, ... }: {
  matches = [ "https://search.nixos.org/*" ];
  css = writeText "custom.css" ''
    :root {
      --background-color: transparent !important;
      --headerbar-background-color: transparent !important;
    }
  '';
}
