{
  pkgs,
  lib,
  config,
  ...
}:
let
  cookie_allows = [
    "https://atcoder.jp"
    "https://bsky.app"
    "https://discord.com"
    "https://github.com"
    "https://ja.scratch-wiki.info"
    "https://misskey.io"
    "https://musescore.com"
    "https://musescore.org"
    "https://orteil.dashnet.org"
    "https://qiita.com"
    "https://scratch.mit.edu"
    "https://www.instagram.com"
    "https://x.com"
  ];
in
{
  imports = [
    ./extensions/wappalyzer.nix
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
      settings = { };
      userChrome = ''
        :root {
          --toolbox-background-color: rgb(0, 0, 0, 0.7) !important;
          --toolbox-background-color-inactive: rgb(0, 0, 0, 0.7) !important;
          --tabpanel-background-color: transparent !important;
        }
        #urlbar-input {
          font-family: monospace !important;
        }
        #sidebar-tools-and-extensions-splitter {
          display: none !important;
        }
        #statuspanel-label {
          background-color: rgba(0 0 0 / 0.3) !important;
          border: none !important;
          font-family: monospace !important;
        }
      '';
    };
    policies = {
      Cookies = {
        Allow = cookie_allows;
        Block = [ "https://www.youtube.com" ];
        Locked = true;
        Behavior = "reject-foreign";
      };
      SanitizeOnShutdown = {
        Cache = true;
        Cookies = true;
        FormData = true;
        History = true;
        Sessions = true;
        SiteSettings = true;
        Locked = true;
        Exceptions = cookie_allows;
      };
      EnableTrackingProtection = {
        Locked = true;
        Category = "strict";
      };
      PasswordManagerEnabled = false;
      DisplayBookmarksToolbar = "never";
      PrimaryPassword = false;
      OverrideFirstRunPage = "";
      SkipTermsOfUse = true;
      TranslateEnabled = false;
      Preferences = lib.listToAttrs (
        lib.mapAttrsToListRecursive
          (path: value: {
            name = lib.join "." path;
            inherit value;
          })
          {
            # about:configにアクセスしたときに警告を表示しない
            "browser.aboutConfig.showWarning" = false;
            # 透過を有効化
            "browser.tabs.allow_transparent_browser" = true;
            # ブックマークバーを表示しない
            "browser.toolbars.bookmarks.visibility" = "never";
            "devtools.chrome.enabled" = true;
            "devtools.debugger.remote-enabled" = true;
            # 開発者ツールは別ウィンドウに分ける
            "devtools.toolbox.host" = "window";
            # 拡張機能が自動的にインストールされるようにする
            "extensions.autoDisableScopes" = 0;
            # Web Speech APIの使用時にエラーが出るが, 通知しない
            "media.webspeech.synth.dont_notify_on_error" = true;
            # タブをPin留めする機能の紹介を消す
            "sidebar.verticalTabs.dragToPinPromo.dismissed" = true;
            # サイドバーが完全に隠れるようにする
            "sidebar.visibility" = "hide-sidebar";
            # カスタム拡張機能を読み込めるようにする
            "xpinstall.signatures.required" = false;

            # about:homeのカスタマイズ
            # Wallpapers
            "browser.newtabpage.activity-stream.newtabWallpapers.user.enabled" = false;

            # Customize sidebar
            # > Move sidebar to the right
            "sidebar.position_start" = true;
            # > Tools
            "sidebar.main.tools" = "";

            # Home and startup
            # > Startup > Open previous windows and tabs
            "browser.startup.page" = 1; # No
            # > Homepage > New windows
            "browser.startup.homepage" = "about:home";
            # > Homepage > New tabs
            "browser.newtabpage.enabled" = true;
            # > Firefox Home
            "browser.newtabpage.activity-stream" = {
              # Search
              showSearch = true;
              # Shortcuts
              "feeds.topsites" = false;
              # Recent activity
              "feeds.section.highlights" = false;
              # Firefox Developer Edition logo
              hideLogo = false;
            };

            # Search
            # > Default search engine > Show search terms in the address bar on results pages
            "browser.urlbar.showSearchTerms.enabled" = false;
            # > Search engine suggestions
            "browser.search.suggest.enabled" = false;
            "browser.urlbar.suggest.searches" = false;
            # > Address Bar
            "browser.urlbar.suggest" = {
              # Browsing history
              history = false;
              # Bookmarks
              bookmark = false;
              # Open tabs
              openpage = false;
              # Shortcuts
              topsites = false;
              # Recent searches
              recentsearches = false;
              # Suggest search engines to use
              engines = false;
              # Quick actions
              quickactions = false;
            };

            # Passwords and autofill
            # > Payment methods > Save and autofill payment info
            "extensions.formautofill.creditCards.enabled" = false;
            # > Addresses and more > Save and autofill addresses
            "extensions.formautofill.addresses.enabled" = false;

            # Appearance
            # > Website appearance
            "layout.css.prefers-color-scheme.content-override" = 2; # System

            # Tabs and browsing
            # > Browser layout
            "sidebar.verticalTabs" = true;
            # > Browser layout > Show sidebar
            "sidebar.revamp" = true;

            # Accessibility
            # > Default zoom
            "browser.zoom.full" = true;

            "browser.uiCustomization.state" = builtins.toJSON {
              placements = {
                nav-bar = [
                  "sidebar-button"
                  "back-button"
                  "stop-reload-button"
                  "forward-button"
                  "urlbar-container"
                  "characterencoding-button"
                  "unified-extensions-button"
                ];
              };
              currentVersion = 26;
              newElementCount = 1;
            };

          }
      );
    };
  };

  home.sessionVariables = {
    BROWSER = lib.getExe config.programs.firefox.package;
  };

  wayland.windowManager.sway.config.window.commands =
    if (config.wayland.windowManager.sway.enable) then
      [
        {
          command = "floating enable";
          criteria = {
            app_id = "firefox-devedition";
            title = "^Picture-in-Picture$";
          };
        }
        {
          command = "floating enable";
          criteria = {
            app_id = "firefox-devedition";
            title = "^Extension: \\(.*\\) - .* — Firefox Developer Edition$";
          };
        }
      ]
    else
      [ ];
}
