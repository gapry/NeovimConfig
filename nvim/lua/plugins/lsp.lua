return {
  {
    "saghen/blink.cmp",

    version = "*",

    opts = {
      keymap = {
        preset = "none",
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      },
      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
        },
      },
      completion = {
        trigger = {
          show_on_trigger_character = true,
          show_in_snippet = true,
        },
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
        menu = {
          auto_show = true,
          border = "rounded",
          draw = {
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", "kind" },
              { "source_name" },
            },
          },
        },
        documentation = {
          auto_show = true,
          window = {
            border = "rounded",
            scrollbar = true,
          },
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
      "neovim/nvim-lspconfig",
      "saghen/blink.cmp",
    },

    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",
          "rust_analyzer",
          "pyright",
          "ruff",
          "texlab",
          "jdtls",
        },
        automatic_enable = {
          exclude = {
            "rust_analyzer", -- rust_analyzer is managed by rustaceanvim
          },
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf, noremap = true, silent = true }
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client == nil then
            return
          end

          if client:supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(false, { bufnr = args.buf })

            vim.keymap.set("n", "<leader>ih", function()
              local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf })
              vim.lsp.inlay_hint.enable(not enabled, { bufnr = args.buf })
            end, { buffer = args.buf, desc = "LSP: Toggle inlay hints" })
          end

          if client.name == "clangd" then
            vim.keymap.set("n", "<leader>ch", "<cmd>LspClangdSwitchSourceHeader<CR>", {
              buffer = args.buf,
              desc = "C/C++: Switch source/header",
            })
          end
        end,
      })

      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })
    end,
  },
}
