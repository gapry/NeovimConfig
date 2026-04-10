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
        fd_opts = "--type f --hidden --exclude .git --exclude node_modules --exclude target",
        resume = false,
      },
      grep = {
        rg_opts = "--column --line-number --no-heading --color=always --smart-case --hidden -g '!.git/'",
      },
    })

    vim.keymap.set("n", "<leader>pf", function()
      if vim.bo.filetype == "oil" then
        require("oil").close()
      end
      fzf.files({ resume = false })
    end, { desc = "Find Files" })

    vim.keymap.set("n", "<leader>psg", fzf.live_grep, { desc = "Grep Project" })
    vim.keymap.set("n", "<leader>pb", fzf.buffers, { desc = "Find Buffers" })
    vim.keymap.set("n", "<leader>psy", fzf.lsp_document_symbols, { desc = "LSP Symbols" })
    vim.keymap.set("n", "<leader>psw", fzf.lsp_live_workspace_symbols, { desc = "LSP Workspace Symbols" })
    vim.keymap.set("n", "<leader>pr", fzf.oldfiles, { desc = "Recent Files" })
    vim.keymap.set("n", "<leader>pl", fzf.blines, { desc = "Buffer Lines" })
    vim.keymap.set("n", "<leader>pp", fzf.resume, { desc = "Resume Last Search" })
    vim.keymap.set("n", "<leader>pg", fzf.git_status, { desc = "Git Changed Files" })
    vim.keymap.set("n", "<leader>pw", fzf.grep_cword, { desc = "Grep Word Under Cursor" })

    vim.keymap.set("n", "gd", function()
      require("fzf-lua").lsp_definitions({ jump_to_single_result = true })
    end, { desc = "Jump to Definition" })

    vim.keymap.set("n", "gr", function()
      require("fzf-lua").lsp_references({ jump_to_single_result = true })
    end, { desc = "Find References" })

    vim.keymap.set("n", "gb", "<C-o>", { desc = "Jump Back" })
    vim.keymap.set("n", "gf", "<C-i>", { desc = "Jump Forward" })
  end,
}
