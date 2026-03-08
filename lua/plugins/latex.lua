return {
  {
    "lervag/vimtex",

    lazy = false,

    init = function()
      vim.g.vimtex_view_method = "zathura"

      vim.g.vimtex_syntax_conceal = {
        additions = 1,
        sections = 1,
        styles = 1,
      }

      vim.g.vimtex_quickfix_mode = 0
    end,
    config = function()
      vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<cr>", { desc = "LaTeX: View PDF" })
      vim.keymap.set("n", "<leader>lc", "<cmd>VimtexClean<cr>", { desc = "LaTeX: Clean auxiliary files" })
    end,
  },
}
