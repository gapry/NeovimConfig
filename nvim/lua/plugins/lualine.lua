return {
  "nvim-lualine/lualine.nvim",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  opts = {
    options = {
      theme = "auto",
    },
    sections = {
      lualine_c = {
        {
          "filename",
          path = 1,
        },
      },
      lualine_x = {
        "diagnostics",
        "lsp_status",
        "filetype",
      },
    },
  },
}
