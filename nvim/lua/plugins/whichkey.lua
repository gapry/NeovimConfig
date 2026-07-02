return {
  "folke/which-key.nvim",

  event = "VeryLazy",

  opts = {
    spec = {
      { "<leader>p", group = "Project/Find" },
      { "<leader>s", group = "Session" },
      { "<leader>h", group = "Git Hunk" },
      { "<leader>o", group = "OpenCode" },
      { "<leader>c", group = "Code/Copilot" },
      { "<leader>r", group = "Rust/Rename" },
      { "<leader>l", group = "LaTeX" },
      { "<leader>x", group = "Diagnostics" },
    },
  },
}
