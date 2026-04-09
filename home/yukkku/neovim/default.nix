_: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    initLua = ''
      vim.opt.number = true
    '';
  };
}
