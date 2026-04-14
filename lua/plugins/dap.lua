return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    require("mason-nvim-dap").setup({
      -- Installs the adapter automatically
      ensure_installed = { "js-debug-adapter" },
      automatic_installation = true,
    })

    dapui.setup()

    -- Automatically open/close UI
    dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
    dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
    dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

    -- Adapter Configuration
    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        -- Mason installs the executable here
        args = { 
          vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug-adapter", 
          "${port}" 
        },
      }
    }

    -- Wrangler Configuration
    local wrangler_config = {
      {
        name = "Attach to Wrangler",
        type = "pwa-node",
        request = "attach",
        cwd = vim.fn.getcwd(),
        port = 9229, -- Default Wrangler inspect port
        sourceMaps = true,
        protocol = "inspector",
      },
    }

    dap.configurations.typescript = wrangler_config
    dap.configurations.javascript = wrangler_config
  end,
}
