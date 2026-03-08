return {
  "nickjvandyke/opencode.nvim",

  version = "*",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    { 
      "folke/snacks.nvim", 
      priority = 1000,
      lazy = false,
      opts = {
        input = { 
          enabled = true 
        }, 
        picker = { 
          enabled = true 
        }, 
      },
    },
  },

  config = function()
    vim.o.autoread = true

    vim.keymap.set({ "n", "x" }, "<leader>oc", function() 
      require("opencode").ask("@this: ", { submit = true }) 
    end, { desc = "OpenCode: Ask AI" })

    vim.keymap.set({ "n", "x" }, "<leader>ox", function() 
      require("opencode").select() 
    end, { desc = "OpenCode: Actions" })

    vim.keymap.set({ "n", "t" }, "<leader>oo", function() 
      require("opencode").toggle() 
    end, { desc = "OpenCode: Toggle Window" })
  end,
}
