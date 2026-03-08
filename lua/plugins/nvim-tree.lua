return {
  "nvim-tree/nvim-tree.lua",

  dependencies = { 
    "nvim-tree/nvim-web-devicons" 
  },

  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,

  opts = {
    view = {
      width = 30,
      side = "left",
    },
    filters = {
      dotfiles = false,
    },
    git = {
      enable = true,
    },
  },

  config = function(_, opts)
    require("nvim-tree").setup(opts)

    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function(data)
        if not data.file or data.file == "" then
          vim.notify("Nvim-tree: No target file specified.", vim.log.levels.INFO)
          return
        end

        local directory = vim.fn.isdirectory(data.file) == 1

        if directory then
          local ok = pcall(vim.cmd.cd, data.file)
          if ok then
            require("nvim-tree.api").tree.open()
          end
        end
      end,
    })

    vim.keymap.set("n", "<leader>e" , "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
    vim.keymap.set("n", "<leader>fe", "<cmd>NvimTreeFocus<CR>", { desc = "Focus File Explorer" })
  end,
}

