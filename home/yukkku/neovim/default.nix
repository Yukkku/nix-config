_: {
  imports = [ ./color.nix ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    initLua = ''
      vim.opt.number = true
      vim.opt.completeopt = { "menu", "menuone", "noselect" }
      vim.opt.clipboard:append({"unnamedplus"})
      vim.opt.expandtab = true

      vim.keymap.set("n", "<C-s>", ":w<CR>")
      vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>")
      vim.keymap.set("v", "<C-s>", "<Esc>:w<CR>")

      local local_config = vim.fn.getcwd() .. "/.vim/workspace.lua"
      if vim.fn.filereadable(local_config) == 1 then
        dofile(local_config)
      end

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

          vim.lsp.inlay_hint.enable()

          -- 自動補完
          if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
          end

          -- 保存時に自動整形
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = args.buf,
            callback = function()
              vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
            end,
          })
        end,
      })

      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          vim.diagnostic.open_float(nil, { focusable = false })
        end,
      })
      vim.opt.updatetime = 250
    '';
  };
}
