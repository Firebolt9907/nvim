return {
  "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
  lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
  dependencies = {
    -- main one
    { "ms-jpq/coq_nvim", branch = "coq" },

    -- 9000+ Snippets
    { "ms-jpq/coq.artifacts", branch = "artifacts" },

    -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
    -- Need to **configure separately**
    { 'ms-jpq/coq.thirdparty', branch = "3p" }
  },
  init = function()
    vim.g.coq_settings = {
      auto_start = 'shut-up',
      display = {
        pum = {
          y_max_len = 2, -- Hides the laggy popup menu
          -- y_ratio = 0,   -- Ensures window ratio calculations don't override the 0
        },
        ghost_text = {
          enabled = true, -- Keeps the lightweight grey inline text
        }
      }
    }
  end,
  config = function()
    local lspconfig = require('lspconfig')
    local coq = require('coq')

    -- Wrap the clangd setup with coq capabilities
    lspconfig.clangd.setup(coq.lsp_ensure_capabilities({
      -- You can add clangd-specific configuration here if needed
      -- cmd = { "clangd", "--background-index" },
    }))
    
    -- Example of setting up other servers:
    -- lspconfig.pyright.setup(coq.lsp_ensure_capabilities({}))
  end,
}
