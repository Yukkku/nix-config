{ pkgs, ... }:
{
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
        # 「新しいタブ」のショートカットを消す
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        # 自作拡張機能が入るようにする
        "xpinstall.signatures.required" = false;
        # 閉じると自動でCookie等が消えるようにす
        "privacy.sanitize.sanitizeOnShutdown" = true;
        # 閉じると消える項目の設定
        "privacy.sanitize.pending" = builtins.toJSON [
          {
            id = "shutdown";
            itemsToClear = [
              "cache"
              "formdata"
              "browsingHistoryAndDownloads"
              "cookiesAndStorage"
            ];
            options = { };
          }
        ];
        # 翻訳のサジェストを消す
        "browser.translations.automaticallyPopup" = false;
        # 背景透明にできるようにする
        "browser.tabs.allow_transparent_browser" = true;
        # userChrome.cssの有効化
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        # userChrome.cssを書くためのデバッグ機能(Ctrl + Shift + Alt + I)
        "devtools.chrome.enabled" = true;
        "devtools.debugger.remote-enabled" = true;
        # 垂直タブを有効にする
        "sidebar.verticalTabs" = true;
        # 垂直タブをデフォルトで非表示にする
        "sidebar.visibility" = "hide-sidebar";
        # ブックマークバーを非表示
        "browser.toolbars.bookmarks.visibility" = "never";
        # 開発者ツールをウィンドウを切り離して表示
        "devtools.toolbox.host" = "window";
      };
      userChrome = ''
        #urlbar-input {
          font-family: monospace !important;
        }
      '';
    };
  };
}
