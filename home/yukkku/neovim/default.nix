_: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    initLua = ''
      vim.opt.number = true
      vim.opt.completeopt = { "menu", "menuone", "noselect" }
      vim.opt.clipboard:append({"unnamedplus"})

      local local_config = vim.fn.getcwd() .. "/.vim/workspace.lua"
      if vim.fn.filereadable(local_config) == 1 then
        dofile(local_config)
      end
    '';
  };
}
