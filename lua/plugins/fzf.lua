return {
  "ibhagwan/fzf-lua",

  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },

  config = function()
    local fzf = require("fzf-lua")

    fzf.setup({
      winopts = {
        height = 0.85,
        width = 0.80,
        preview = {
          layout = "vertical",
          vertical = "down:45%",
        },
      },
      files = {
        formatter = "path.filename_first",
      },
    })

    vim.keymap.set("n", "<leader>pf", fzf.files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>ps", fzf.live_grep, { desc = "Grep Project" })
    vim.keymap.set("n", "<leader>pb", fzf.buffers, { desc = "Find Buffers" })
    vim.keymap.set("n", "<leader>psy", fzf.lsp_document_symbols, { desc = "LSP Symbols" })
  end
}

