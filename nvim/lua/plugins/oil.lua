return {
  "stevearc/oil.nvim",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  opts = {
    default_file_explorer = true,

    columns = {
      "icon",
      "permissions",
      "size",
      "mtime",
    },

    view_options = {
      show_hidden = true,
    },

    keymaps = {
      ["<C-s>"] = "actions.select_vsplit",
      ["<C-h>"] = "actions.select_split",
      ["<C-t>"] = "actions.select_tab",
      ["<CR>"] = "actions.select",
      ["g."] = "actions.toggle_hidden",
      ["q"] = "actions.close",
      ["-"] = "actions.parent",
      ["<C-p>"] = "actions.preview",
    },

    use_default_keymaps = false,
  },

  config = function(_, opts)
    require("oil").setup(opts)

    vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })

    vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>", { desc = "File Explorer" })

    vim.keymap.set("n", "<leader>fe", function()
      require("oil").open(vim.fn.expand("%:p:h"))
    end, { desc = "Explorer (current file)" })

    vim.keymap.set("n", "<leader>E", function()
      require("oil").open(vim.fn.getcwd())
    end, { desc = "Explorer (project root)" })
  end,
}
