return {
  {
    "saghen/blink.cmp",

    version = "*",

    opts = {
      keymap = {
        preset = "default",
      },
      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
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
      "williamboman/mason.nvim",
    },

    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",
          "rust_analyzer",
          "pyright",
          "texlab",
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
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      local on_attach = function(_, bufnr)
        local opts = {
          buffer = bufnr,
          noremap = true,
          silent = true,
        }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
      end

      local servers = {
        "clangd",
        "rust_analyzer",
        "pyright",
        "texlab",
      }

      local server_configs = {
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
              },
              checkOnSave = {
                command = "clippy",
              },
            },
          },
        },
        texlab = {
          settings = {
            texlab = {
              build = {
                onSave = true,
                forwardSearchAfter = true,
                executable = "latexmk",
                args = {
                  "-pdf",
                  "-interaction=nonstopmode",
                  "-synctex=1",
                  "%f",
                },
              },
              forwardSearch = {
                executable = "zathura",
                args = {
                  "--synctex-forward",
                  "%l:1:%f",
                  "%p",
                },
              },
              chktex = {
                onOpenAndSave = true,
              },
            },
          },
        },
      }

      for _, server in ipairs(servers) do
        local opts = {
          on_attach = on_attach,
          capabilities = capabilities,
        }

        if server_configs[server] then
          opts = vim.tbl_deep_extend("force", opts, server_configs[server])
        end

        vim.lsp.config(server, opts)
      end

      vim.lsp.enable(servers)
    end,
  },
}
