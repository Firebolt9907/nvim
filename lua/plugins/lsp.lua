return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- 1. Initialize Mason
    require("mason").setup()

    -- 2. Use the new standard name: ts_ls
    require("mason-lspconfig").setup({
      ensure_installed = { "clangd" }, 
    })

    -- 3. Explicitly start ts_ls (this silences the tsserver deprecation warning)
    -- require("lspconfig").ts_ls.setup({})

    -- 4. Your LSP Keybinds

    vim.diagnostic.config({
      virtual_text = true,
    })

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(event)
        local opts = { buffer = event.buf }

        -- Hover Documentation: Press Shift+K
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

        -- Go to Definition: Press 'gd'
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

        -- Rename: Press <BS> + r
        vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)

        -- Code Actions: Press <BS> + a
        vim.keymap.set({'n', 'v'}, '<leader>a', vim.lsp.buf.code_action, opts)
      end,
    })
  end
}
