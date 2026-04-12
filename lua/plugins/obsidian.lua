return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  ft = "markdown",
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in the next major release
    workspaces = {
      {
        name = "CS 182",
        path = "/Users/rishu/Library/Mobile Documents/iCloud~md~obsidian/Documents/CS 182",
      },
      {
        name = "CS 240",
        path = "/Users/rishu/Library/Mobile Documents/iCloud~md~obsidian/Documents/CS 240",
      },
      {
        name = "QSO",
        path = "/Users/rishu/Library/Mobile Documents/iCloud~md~obsidian/Documents/QSO"
      }
    },
  },
}
