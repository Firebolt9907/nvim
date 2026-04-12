return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  
  -- SAFETY NET 1: Deferred Loading
  -- This tells Lazy: "Do NOT load this plugin during the chaotic startup phase. 
  -- Wait until Neovim is fully booted and I actually open a file."
  event = { "BufReadPost", "BufNewFile" },
  
  config = function()
    -- SAFETY NET 2: The Protected Call (pcall)
    -- This tries to load the module. If the file is missing or still downloading, 
    -- it silently aborts instead of crashing your entire editor with red text.
    local status_ok, configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
      return
    end

    configs.setup({
      ensure_installed = { 
        "javascript", 
        "typescript", 
        "tsx", 
        "dart", 
        "lua", 
        "vim", 
        "vimdoc", 
        "json", 
        "html", 
        "css" 
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
