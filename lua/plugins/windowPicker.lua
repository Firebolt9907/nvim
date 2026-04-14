return {
  "s1n7ax/nvim-window-picker",
  name = "window-picker",
  version = "2.*",
  keys = {
    { "<leader>w", function() 
        local picked_window_id = require("window-picker").pick_window()
        if picked_window_id then
          vim.api.nvim_set_current_win(picked_window_id)
        end
      end, 
      desc = "Pick a window to jump to" 
    },
  },
  config = function()
    require("window-picker").setup({
      hint = "floating-big-letter",
      selection_chars = "uhetonasid",
      filter_rules = {
        -- Force letters to show even if there is only one option
        autoselect_one = false, 
        include_current_win = true,
        bo = {
          -- By putting this here, we overwrite the defaults 
          -- so it no longer ignores NvimTree or terminals
          filetype = { "notify", "noice" },
          buftype = {}, 
        },
      },
    })
  end,
}
