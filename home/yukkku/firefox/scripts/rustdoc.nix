{ writeText, ... }: {
  matches = [ "<all_urls>" ];
  css = writeText "custom.css" ''
    :root:has(rustdoc-topbar, rustdoc-toolbar) {
      --main-background-color: transparent !important;
      --sidebar-background-color: transparent !important;
      --code-block-background-color: rgba(0 0 0 / 0.3) !important;
      --stab-background-color: rgba(0 0 0 / 0.3) !important;
      --src-sidebar-background-selected: rgba(0 0 0 / 0.3) !important;
      --sidebar-current-link-background-color: rgba(0 0 0 / 0.3) !important;
      --button-background-color: rgba(0 0 0 / 0.3) !important;
      --search-color: #fff !important;
      --search-tab-button-not-selected-background: rgba(0 0 0 / 0.3) !important;
      --search-tab-button-selected-background: rgba(0 0 0 / 0.5) !important;
      & .docblock code {
        background-color: transparent !important;
      }
      & .sidebar .current {
         background-color: transparent !important;
      }
    }
  '';
}
