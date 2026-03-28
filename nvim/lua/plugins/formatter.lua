return {
  "stevearc/conform.nvim",

  opts = {
    formatters_by_ft = {
      c = { "clang_format" },
      cpp = { "clang_format" },
      rust = { "rustfmt" },
      lua = { "stylua" },
    },

    format_on_save = false,
  },

  config = function(_, opts)
    local conform = require("conform")
    conform.setup(opts)

    vim.keymap.set({ "n", "v" }, "<leader>f", function()
      conform.format({
        lsp_fallback = true,
        async = true,
        timeout_ms = 500,
      })
    end, { desc = "Format buffer" })
  end,
}
