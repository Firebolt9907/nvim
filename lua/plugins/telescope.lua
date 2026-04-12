return {
  "nvim-telescope/telescope.nvim",
  dependencies = { 
    "nvim-lua/plenary.nvim" 
  },
  keys = {
    -- Find Files (IntelliJ: Shift+Shift -> Files tab)
    { "<leader>f", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
    
    -- Search Text Inside Files (IntelliJ: Ctrl+Shift+F)
    -- Note: Requires 'ripgrep' to be installed on your computer
    { "<leader>g", "<cmd>Telescope live_grep<CR>", desc = "Search inside files" },
    
    -- Jump between open tabs/buffers
    { "<leader>b", "<cmd>Telescope buffers<CR>", desc = "Find open buffers" },

    -- FIND FUNCTIONS/SYMBOLS (LSP Document Symbols)
    -- This asks the LSP server for a list of every function/symbol in your current file
    { "<leader>s", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Find Functions in file" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        -- Optional: Makes the popup look a bit cleaner by using a rounded border
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        
        -- Ignore your node_modules so searches stay lightning fast
        file_ignore_patterns = {
          "node_modules",
          ".git",
          ".wrangler"
        },
      }
    })
  end,
}
