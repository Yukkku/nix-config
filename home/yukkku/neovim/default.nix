{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    coc.enable = true;
    plugins = [ pkgs.vimPlugins.vim-airline ];
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
}
