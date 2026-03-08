return {
  {
    "saghen/blink.cmp",

    version = "*",

    opts = {
      keymap = { 
        preset = "default" 
      },
      sources = {
        default = { 
          "lsp",
          "path",
          "snippets",
          "buffer"
        },
      },
    },
  },
  {
    "williamboman/mason.nvim",

    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",

    dependencies = { 
      "williamboman/mason.nvim" 
    },

    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { 
          "clangd",
          "rust_analyzer",
          "pyright" 
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "saghen/blink.cmp",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },

    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      local on_attach = function(_, bufnr)
        local opts = { 
          buffer = bufnr, 
          noremap = true, 
          silent = true 
        }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
      end

      vim.lsp.config('clangd', {
        on_attach = on_attach,
        capabilities = capabilities,
      })

      vim.lsp.config('rust_analyzer', {
        on_attach = on_attach,
        capabilities = capabilities,

        settings = {
          ["rust-analyzer"] = {
            cargo = { 
              allFeatures = true 
            },
            checkOnSave = { 
              command = "clippy"
            },
          }
        }
      })

      vim.lsp.config('pyright', {
        on_attach = on_attach,
        capabilities = capabilities,
      })

      vim.lsp.enable({
        'clangd',
        'rust_analyzer',
        'pyright'
      })
    end,
  },
}
