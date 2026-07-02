return {
  "mrcjkb/rustaceanvim",

  version = "^8",

  lazy = false,

  init = function()
    vim.g.rustaceanvim = {
      server = {
        default_settings = vim.lsp.config["rust_analyzer"] and vim.lsp.config["rust_analyzer"].settings or nil,
      },
    }
  end,

  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "rust",
      callback = function(args)
        local opts = { buffer = args.buf, silent = true }

        vim.keymap.set("n", "<leader>rr", function()
          vim.cmd.RustLsp("runnables")
        end, vim.tbl_extend("force", opts, { desc = "Rust: Runnables" }))

        vim.keymap.set("n", "<leader>rd", function()
          vim.cmd.RustLsp("debuggables")
        end, vim.tbl_extend("force", opts, { desc = "Rust: Debuggables" }))

        vim.keymap.set("n", "<leader>re", function()
          vim.cmd.RustLsp("explainError")
        end, vim.tbl_extend("force", opts, { desc = "Rust: Explain error" }))
      end,
    })
  end,
}
