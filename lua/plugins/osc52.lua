return {
  "ojroques/nvim-osc52",
  config = function()
    local osc52 = require("osc52")
    osc52.setup {
      max_length = 0,           -- Unlimited length
      silent = false,           -- Show message on successful copy
      trim = false,             -- Do not trim whitespace
    }

    -- Automatically copy to system clipboard when yanking to the + register
    local function copy()
      if vim.v.event.operator == "y" and vim.v.event.regname == "+" then
        osc52.copy_register("+")
      end
    end

    vim.api.nvim_create_autocmd("TextYankPost", { callback = copy })
  end,
}
