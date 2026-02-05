{ pkgs, ... }:
{
  home.username = "yukkku";
  home.homeDirectory = "/home/yukkku";

  home.packages = with pkgs; [
    screenfetch
    htop
    tree

    nixd
    nixfmt-rfc-style
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "Yukkku";
      user.email = "yukku.scratcher@gmail.com";
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
      noremap  <silent> <C-S> :update<CR>
      vnoremap <silent> <C-S> <C-C>:update<CR><Esc>
      inoremap <silent> <C-S> <C-O>:update<CR><Esc>
    '';
  };

  programs.bash.enable = true;

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
}
