return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  event = "BufRead", -- Load usually on file open
  opts = {
    provider_selector = function(bufnr, filetype, buftype)
      return { "lsp", "indent" }
    end,
  },
  init = function()
    -- UFO needs these options to be set for it to work correctly
    vim.o.foldcolumn = "0"
    vim.o.foldlevel = 99 -- Using ufo provider need a large value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
  config = function(_, opts)
    require("ufo").setup(opts)
    vim.o.foldcolumn = "0"

    -- keymaps
    vim.keymap.set("n", "zR", require("ufo").openAllFolds)
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
    -- NEW: map Space to toggle folds
    vim.keymap.set("n", "<CR>", "za", { desc = "Toggle Fold" })
  end,
}

