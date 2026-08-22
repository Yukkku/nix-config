{ writeText, ... }: {
  matches = [ "https://kenkoooo.com/atcoder" ];
  js = writeText "custom.js" ''
    localStorage.setItem("theme", '"auto"');
  '';
  css = writeText "custom.css" ''
    body {
      background-color: transparent !important;
    }
  '';
}
