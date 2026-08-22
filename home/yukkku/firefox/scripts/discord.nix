{ writeText, ... }: {
  matches = [
    "https://discord.com/app"
    "https://discord.com/channels/*"
  ];
  css = writeText "custom.css" ''
    :root, .theme-dark {
      --background-base-lowest: transparent !important;
      --background-base-lower: transparent !important;
      --background-surface-high: rgba(0 0 0 / 0.5) !important;
      --background-base-low: rgba(0 0 0 / 0.5) !important;
      --chat-background-default: rgba(0 0 0 / 0.5) !important;
    }
  '';
}
