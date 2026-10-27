return {
  "mrcjkb/rustaceanvim",

  version = "^8",

  lazy = false,

  init = function()
    -- Drop rustaceanvim's multi-line standalone-mode INFO notice (it triggers a hit-enter prompt)
    local notify = vim.notify
    vim.notify = function(msg, level, opts)
      if type(msg) == "string" and level == vim.log.levels.INFO and msg:find("detached/standalone mode", 1, true) then
        return
      end
      return notify(msg, level, opts)
    end

    vim.g.rustaceanvim = {
      server = {
        settings = function(project_root, default_settings)
          local base = vim.lsp.config["rust_analyzer"] and vim.lsp.config["rust_analyzer"].settings or {}
          local settings = vim.deepcopy(base)
          local ra = settings["rust-analyzer"] or {}
          settings["rust-analyzer"] = ra

          -- Single-file (rustc, no Cargo.toml): skip cargo-based checks/metadata to avoid hanging
          if not project_root or vim.fn.filereadable(project_root .. "/Cargo.toml") == 0 then
            ra.checkOnSave = false
            ra.cargo = { autoreload = false, buildScripts = { enable = false } }
            ra.procMacro = { enable = false }
            ra.check = nil
          end

          return vim.tbl_deep_extend("force", default_settings or {}, settings)
        end,
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
