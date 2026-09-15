{
  pkgs,
  lib,
  config,
  ...
}:
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
      '';
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
      EnableTrackingProtection = {
        Locked = true;
        Category = "strict";
      };
      PasswordManagerEnabled = false;
      DisplayBookmarksToolbar = "never";
      PrimaryPassword = false;
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
