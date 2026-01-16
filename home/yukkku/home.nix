{ pkgs, ... }:
{
  home.username = "yukkku";
  home.homeDirectory = "/home/yukkku";

  home.packages = with pkgs; [
    screenfetch
    htop
    grim
    musescore
    golly

    swaybg
    wl-clipboard
    brightnessctl

    # fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    nerd-fonts.hack
    jigmo

    # nixのlspなど
    nixd
    nixfmt-rfc-style
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "Hack Nerd Font" ];
    };
  };

  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = [ pkgs.fcitx5-skk ];
    fcitx5.settings.inputMethod = {
      GroupOrder = {
        "0" = "Default";
      };
      "Groups/0" = {
        Name = "Default";
        "Default Layout" = "jp";
        DefaultIM = "skk";
      };
      "Groups/0/Items/0" = {
        Name = "skk";
        Layout = "";
      };
    };
    fcitx5.settings.addons.skk.globalSection = {
      InitialInputMode = "Latin";
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "Yukkku";
      user.email = "yukku.scratcher@gmail.com";
    };
  };

  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod4";
      input = {
        "type:keyboard" = {
          xkb_model = "jp106";
          xkb_layout = "jp";
        };
      };
      defaultWorkspace = "workspace number 1";
      gaps.inner = 16;
      window.border = 0;
      window.titlebar = false;
      bars = [ ];
      startup = [
        { command = "swaybg -i ${./bg.jpg}"; }
      ];
      modes.resize = {
        "Escape" = "mode default";
        "Down" = "resize grow height 16 px";
        "Left" = "resize shrink width 16 px";
        "Right" = "resize grow width 16 px";
        "Up" = "resize shrink height 16 px";
        "h" = "resize shrink width 16 px";
        "j" = "resize grow height 16 px";
        "k" = "resize shrink height 16 px";
        "l" = "resize grow width 16 px";
      };
    };
  };
  xdg = {
    enable = true;
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
      ];
      config.common.default = "*";
    };
  };

  programs.foot = {
    enable = true;
    settings = {
      main.font = "Hack Nerd Font:pixelsize=13.3";
      main.line-height = "16px";
      colors = {
        background = "000000";
        alpha = 0.7;
      };
    };
  };

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
      userChrome = "";
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    coc.enable = true;
    coc.settings = {
      languageserver = {
        nix = {
          command = "nixd";
          filetypes = [ "nix" ];
        };
      };
      "coc.preferences.formatOnSaveFiletypes" = [ "nix" ];
    };
    plugins = [
      pkgs.vimPlugins.vim-airline
    ];
    extraConfig = ''
      set number
      colorscheme zaibatsu
      highlight Normal guibg=None
      highlight EndOfBuffer guibg=None
      set clipboard+=unnamedplus
      noremap <silent> <C-S>          :update<CR>
      vnoremap <silent> <C-S>         <C-C>:update<CR><Esc>
      inoremap <silent> <C-S>         <C-O>:update<CR><Esc>
    '';
  };

  programs.zathura = {
    enable = true;
    options = {
      default-bg = "rgba(0, 0, 0, 0.7)";
    };
  };

  programs.bash.enable = true;

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
}
