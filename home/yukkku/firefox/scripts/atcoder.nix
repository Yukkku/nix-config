{ writeText, ... }: [
  {
    matches = [ "https://atcoder.jp/*" ];
    js = writeText "custom.js" ''
      localStorage.setItem("ace-options", JSON.stringify({
        theme: "ace/theme/monokai",
      }))
      document.head.append()
    '';
    css = writeText "custom.css" ''
      :root {
        color-scheme: dark light;
      }
      body {
        background-color: transparent !important;
        color: unset !important;
      }
      #main-div {
        background-color: transparent !important;
      }
      #main-container {
        width: 100vw !important;
        background-color: transparent !important;
        box-shadow: none !important;
      }
      .ace_editor {
        background-color: rgba(0 0 0 / 0.3) !important;
      }
      #fixed-server-timer {
        color: #333;
      }

      .insert-participant-box {
        background-color: rgba(0 0 0 / 0.3) !important;
      }

      .panel {
        background-color: transparent !important;
      }

      .panel-default > .panel-heading {
        background-color: transparent !important;
        color: unset !important;
      }

      .table-striped > tbody > tr {
        &:nth-of-type(2n+1):not(:hover) {
          background-color: rgba(0 0 0 / 0.3) !important;
        }
        &:hover {
          background-color: rgba(0 0 0 / 0.5) !important;
        }
      }

      .dropdown-menu {
        background-color: rgba(0 0 0 / 0.5) !important;
        & > li > a {
          color: unset !important;
        }
      }

      .btn-default {
        background-color: rgba(0 0 0 / 0.3) !important;
        color: unset !important;
        &:hover {
          background-color: rgba(0 0 0 / 0.5) !important;
        }
      }

      .nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus {
        background-color: rgba(0 0 0 / 0.3) !important;
        color: unset !important;
      }
      .nav > li > a:hover, .nav > li > a:focus {
        background-color: rgba(0 0 0 / 0.5) !important;
        color: unset !important;
      }

      .form-control {
        background-color: rgba(0 0 0 / 0.3) !important;
      }

      .select2-container--default .select2-selection--single,
      .select2-container--bootstrap .select2-selection {
        background-color: rgba(0 0 0 / 0.3) !important;
        & > span {
          color: canvasText !important;
        }
      }
      .select2-dropdown {
        background-color: rgba(0 0 0 / 0.5) !important;
      }
      .select2-container--bootstrap {
        & .select2-results__option[aria-selected="true"] {
          background-color: rgba(0 0 0 / 0.5) !important;
          color: unset !important;
        }
        & .select2-search--dropdown .select2-search__field {
          background-color: rgba(0 0 0 / 0.5) !important;
          color: unset !important;
        }
      }

      pre {
        background-color: rgba(0 0 0 / 0.3) !important;
        color: unset !important;
      }
      code {
        background-color: rgba(0 0 0 / 0.3) !important;
      }

      a {
        color: linkText;
      }
    '';
  }
]
