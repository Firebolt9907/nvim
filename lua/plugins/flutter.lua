return {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- Optional: Makes Neovim's UI menus look incredibly modern
  },
  config = function()
    require("flutter-tools").setup({
      ui = {
        -- Defines how the Flutter log window looks
        border = "rounded",
      },
      decorations = {
        statusline = {
          -- Shows your active device and app version in your statusline
          app_version = true,
          device = true,
        }
      },
      lsp = {
        -- If you want Flutter to use the exact same styling as your other LSPs
        color = {
          enabled = true,
          background = false,
          virtual_text = true,
        },
      },
    })
  end,
  keys = {
    -- We use `<BS> + F` as a prefix for Flutter commands to keep things organized
    { "<leader>Fr", "<cmd>FlutterRun<CR>", desc = "Flutter: Run App" },
    { "<leader>Fq", "<cmd>FlutterQuit<CR>", desc = "Flutter: Quit App" },
    { "<leader>Fl", "<cmd>FlutterReload<CR>", desc = "Flutter: Hot Reload" },
    { "<leader>FR", "<cmd>FlutterRestart<CR>", desc = "Flutter: Hot Restart" },
    { "<leader>Fd", "<cmd>FlutterDevices<CR>", desc = "Flutter: Select Device/Emulator" },
    
    -- Opens a Telescope menu with every single Flutter command available!
    { "<leader>Fc", "<cmd>Telescope flutter commands<CR>", desc = "Flutter: Telescope Commands" },
  }
}
