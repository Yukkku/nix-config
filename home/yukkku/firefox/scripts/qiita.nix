{ writeText, ... }: {
  matches = [ "https://qiita.com/*" ];
  css = writeText "custom.css" ''
    :root {
      --color-background: transparent !important;
      --color-surface: rgba(0 0 0 / 0.3) !important;
      --color-surfaceVariant: rgba(0 0 0 / 0.3) !important;
      --markdown-color-inlineCodeContainer: rgba(0 0 0 / 0.3) !important;
      --color-greenContainerVariant: rgba(0 128 0 / 0.3) !important;
      --color-yellowContainerVariant: rgba(128 128 0 / 0.3) !important;
      --color-redContainerVariant: rgba(128 0 0 / 0.3) !important;
    }

    #GlobalHeader {
      --color-surface: rgba(0 0 0 / 0.5) !important;
    }

    #NotificationDropdown > * {
      --color-surface: transparent !important;
    }

    main > .p-items_main > article {
      background-color: transparent !important;
      + div > * {
        background-color: transparent !important;
        & > div {
        background-color: transparent !important;
        }
      }
    }

    :is(.co-Item_text, .it-MdContent) {
      & tr:has(th) {
        background-color: transparent !important;
      }
      & .code-frame {
        background-color: rgba(0 0 0 / 0.3);
        & > .code-lang {
          background-color: rgba(0 0 0 / 0.3);
        }
        & > .highlight {
          background-color: transparent;
        }
      }
    }

    #global-footer {
      background-color: rgba(0 0 0 / 0.3) !important;
    }
  '';
}
