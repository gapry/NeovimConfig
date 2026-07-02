return {
  "lewis6991/gitsigns.nvim",

  event = { "BufReadPre", "BufNewFile" },

  opts = {
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")

      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end

      map("n", "]h", function()
        gitsigns.nav_hunk("next")
      end, "Git: Next hunk")

      map("n", "[h", function()
        gitsigns.nav_hunk("prev")
      end, "Git: Previous hunk")

      map("n", "<leader>hs", gitsigns.stage_hunk, "Git: Stage hunk")
      map("n", "<leader>hr", gitsigns.reset_hunk, "Git: Reset hunk")
      map("n", "<leader>hp", gitsigns.preview_hunk, "Git: Preview hunk")
      map("n", "<leader>hb", function()
        gitsigns.blame_line({ full = true })
      end, "Git: Blame line")
    end,
  },
}
