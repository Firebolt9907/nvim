return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  
  -- 1. Define your settings in a standard opts table
  opts = {
    scope = {
      enabled = true,
      show_start = true,
      show_end = false,
      highlight = { "IblScopeForce" },
    },
    indent = {
      char = "│",
      tab_char = "│",
    },
  },
  
  -- 2. Use the config function to run code and initialize the plugin
  config = function(_, opts)
    -- Create the highlight group immediately before the plugin loads
    vim.api.nvim_set_hl(0, "IblScopeForce", { fg = "#00FF00", bold = true })
    
    -- Ensure the highlight survives if you change colorschemes later
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        vim.api.nvim_set_hl(0, "IblScopeForce", { fg = "#00FF00", bold = true })
      end,
    })

    -- Explicitly tell the plugin to setup using the opts table above
    require("ibl").setup(opts)
  end,
}
