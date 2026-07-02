return {
  {
    "nvim-treesitter/nvim-treesitter",

    branch = "master",

    build = ":TSUpdate",

    main = "nvim-treesitter.configs",

    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },

    opts = {
      -- https://github.com/nvim-treesitter/nvim-treesitter/tree/master#supported-languages
      ensure_installed = {
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
      },
      highlight = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
          },
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",

    branch = "master",
  },
}

