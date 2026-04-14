return {
    "OXY2DEV/markview.nvim",
    lazy = false, -- Required for markview to load correctly
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    opts = {
        latex = {
            enable = true,
            renderer = "latex" 
        }
    }
}
