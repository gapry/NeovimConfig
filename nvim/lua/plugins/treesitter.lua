return {
  {
    "nvim-treesitter/nvim-treesitter",

    branch = "main",

    -- The main branch does not support lazy-loading.
    lazy = false,

    build = ":TSUpdate",

    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
      },
    },

    config = function()
      -- https://github.com/nvim-treesitter/nvim-treesitter/tree/main#supported-languages
      require("nvim-treesitter").install({
        "cmake",
        "make",
        "asm",
        "c",
        "cpp",
        "rust",
        "go",
        "zig",
        "nix",
        "haskell",
        "scala",
        "python",
        "lua",
        "bash",
        "vim",
        "vimdoc",
      })

      -- Highlighting is provided by Neovim; enable it per buffer.
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })

      require("nvim-treesitter-textobjects").setup({
        select = {
          lookahead = true,
        },
        move = {
          set_jumps = true,
        },
      })

      local select = require("nvim-treesitter-textobjects.select")

      vim.keymap.set({ "x", "o" }, "af", function()
        select.select_textobject("@function.outer", "textobjects")
      end)

      vim.keymap.set({ "x", "o" }, "if", function()
        select.select_textobject("@function.inner", "textobjects")
      end)

      vim.keymap.set({ "x", "o" }, "ac", function()
        select.select_textobject("@class.outer", "textobjects")
      end)

      vim.keymap.set({ "x", "o" }, "ic", function()
        select.select_textobject("@class.inner", "textobjects")
      end)

      local move = require("nvim-treesitter-textobjects.move")

      vim.keymap.set({ "n", "x", "o" }, "]f", function()
        move.goto_next_start("@function.outer", "textobjects")
      end)

      vim.keymap.set({ "n", "x", "o" }, "[f", function()
        move.goto_previous_start("@function.outer", "textobjects")
      end)
    end,
  },
}
