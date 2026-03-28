return {
  "mfussenegger/nvim-dap",

  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "jay-babu/mason-nvim-dap.nvim",
  },

  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local vscode = require("dap.ext.vscode")

    require("mason-nvim-dap").setup({
      ensure_installed = {
        "codelldb",
        "debugpy",
      },

      automatic_installation = true,

      handlers = {
        function(config)
          require("mason-nvim-dap").default_setup(config)
        end,
      },
    })

    dap.configurations.c = {}

    dap.configurations.cpp = {}

    dap.configurations.rust = {}

    -- https://github.com/rcarriga/nvim-dap-ui/blob/master/doc/nvim-dap-ui.txt
    dapui.setup({
      layouts = {
        {
          elements = {
            {
              id = "scopes",
              size = 0.40,
            },
            {
              id = "stacks",
              size = 0.40,
            },
            {
              id = "breakpoints",
              size = 0.10,
            },
            {
              id = "watches",
              size = 0.10,
            },
          },
          position = "left",
          size = 110,
        },
        {
          elements = {
            {
              id = "repl",
              size = 0.5,
            },
            {
              id = "console",
              size = 0.5,
            },
          },
          position = "bottom",
          size = 7,
        },
      },
    })

    vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
    vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
    vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
    vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end

    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end

    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
}
