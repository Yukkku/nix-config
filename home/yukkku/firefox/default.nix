{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    ./extensions/wappalyzer.nix
    ./extensions/mypass.nix
    ./extensions/nos2x-fox.nix
    ./scripts
  ];

  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition;
    profiles.dev-edition-default = {
      isDefault = true;
      search = {
        force = true;
        default = "ddg";
      };
      settings = {
        "devtools.chrome.enabled" = true;
        "devtools.debugger.remote-enabled" = true;
        "devtools.toolbox.host" = "window";

        "extensions.autoDisableScopes" = 0;

        "media.webspeech.synth.dont_notify_on_error" = true;

        "sidebar.main.tools" = " ";
        "sidebar.verticalTabs" = true;
        "sidebar.verticalTabs.dragToPinPromo.dismissed" = true;
        "sidebar.visibility" = "hide-sidebar";
        # UIのカスタマイズの設定
        "browser.uiCustomization.state" = builtins.toJSON {
          placements = {
            widget-overflow-fixed-list = [ ];
            unified-extensions-area = [ ];
            nav-bar = [
              "sidebar-button"
              "back-button"
              "forward-button"
              "urlbar-container"
              "vertical-spacer"
              "unified-extensions-button"
            ];
            toolbar-menubar = [ "menubar-items" ];
            TabsToolbar = [ ];
            vertical-tabs = [
              "tabbrowser-tabs"
            ];
            PersonalToolbar = [
              "import-button"
              "personal-bookmarks"
            ];
          };
          seen = [
            "developer-button"
            "profiler-button"
            "screenshot-button"
          ];
          dirtyAreaCache = [
            "nav-bar"
            "TabsToolbar"
            "vertical-tabs"
            "PersonalToolbar"
            "toolbar-menubar"
          ];
          currentVersion = 23;
          newElementCount = 2;
        };
      };
      userChrome = ''
        :root {
          --toolbox-background-color: rgb(0, 0, 0, 0.7) !important;
          --toolbox-background-color-inactive: rgb(0, 0, 0, 0.7) !important;
          --tabpanel-background-color: transparent !important;
        }
        #urlbar-input {
          font-family: monospace !important;
        }
      '';
      # extensions.force = true;
    };
    policies = {
      Cookies = {
        Allow = [
          "https://atcoder.jp"
          "https://bsky.app"
          "https://discord.com"
          "https://github.com"
          "https://ja.scratch-wiki.info"
          "https://misskey.io"
          "https://musescore.com"
          "https://musescore.org"
          "https://qiita.com"
          "https://scratch.mit.edu"
          "https://www.instagram.com"
          "https://x.com"
        ];
        Block = [ "https://www.youtube.com" ];
        Locked = true;
        Behavior = "reject-foreign";
      };
      SanitizeOnShutdown = true;
      ExtensionSettings = {
        "*".installation_mode = "blocked";
      };
      EnableTrackingProtection = {
        Locked = true;
        Category = "strict";
      };
      PasswordManagerEnabled = false;
      DisplayBookmarksToolbar = "never";
      PrimaryPassword = false;
      Preferences =
        lib.mapAttrs
          (_: val: {
            Value = val;
            Status = "locked";
          })
          {
            "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
            "browser.newtabpage.activity-stream.feeds.topsites" = false;
            "browser.newtabpage.activity-stream.newtabWallpapers.enabled" = false;
            "browser.newtabpage.activity-stream.showSearch" = true;
            "browser.tabs.allow_transparent_browser" = true;
            "browser.translations.automaticallyPopup" = false;

            # userChrome.css の有効化
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

            # カスタム拡張機能を読み込めるようにする
            "xpinstall.signatures.required" = false;
          };
    };
  };

  home.sessionVariables = {
    BROWSER = lib.getExe config.programs.firefox.package;
  };
}
