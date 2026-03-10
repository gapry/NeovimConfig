return {
  "ibhagwan/fzf-lua",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
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
    vim.keymap.set("n", "<leader>psw", fzf.lsp_live_workspace_symbols, { desc = "LSP Workspace Symbols" })

    vim.keymap.set("n", "gd", function()
      require("fzf-lua").lsp_definitions({ jump_to_single_result = true })
    end, { desc = "Jump to Definition" })

    vim.keymap.set("n", "gb", "<C-o>", { desc = "Jump Back" })
    vim.keymap.set("n", "gf", "<C-i>", { desc = "Jump Forward" })

    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        vim.schedule(function()
          vim.cmd("normal! zz")
        end)
      end,
    })
  end,
}
