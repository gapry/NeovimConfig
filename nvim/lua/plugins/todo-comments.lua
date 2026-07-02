return {
  "folke/todo-comments.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  event = { "BufReadPre", "BufNewFile" },

  opts = {},

  keys = {
    {
      "<leader>pt",
      function()
        require("todo-comments.fzf").todo()
      end,
      desc = "Find TODOs",
    },
  },
}
