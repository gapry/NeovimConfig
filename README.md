## Install

```bash
$ curl -sL https://raw.githubusercontent.com/gapry/NeovimConfig/main/utils/install.sh | bash
```

## Development

```bash
$ make format  # format lua sources with stylua
$ make local   # sync local changes to ~/.config/nvim for quick testing
$ make plugins # headless install/sync plugins and treesitter
$ make install # test the curl remote installation
```

## Architecture

```
                              ┌─────────────────┐
                              │    init.lua     │  options / keymaps / autocmds
                              └────────┬────────┘
                                       │
                              ┌────────▼────────┐
                              │   lazy.nvim     │  plugin manager
                              └────────┬────────┘
        ┌──────────────┬───────────────┼───────────────┬──────────────┐
        │              │               │               │              │
  ┌─────▼─────┐  ┌─────▼─────┐  ┌──────▼──────┐  ┌─────▼─────┐  ┌─────▼─────┐
  │    LSP    │  │   Debug   │  │   Editing   │  │    UI     │  │    AI     │
  ├───────────┤  ├───────────┤  ├─────────────┤  ├───────────┤  ├───────────┤
  │ mason     │  │ nvim-dap  │  │ treesitter  │  │ catppuccin│  │ copilot   │
  │ lspconfig │  │ dap-ui    │  │ textobjects │  │ lualine   │  │ opencode  │
  │ blink.cmp │  │ codelldb  │  │ conform     │  │ which-key │  └───────────┘
  │ rustacean │  │ debugpy   │  │ autopairs   │  │ gitsigns  │
  │ trouble   │  │           │  │ vimtex      │  │ oil       │
  └─────┬─────┘  └───────────┘  └─────────────┘  │ fzf-lua   │
        │                                        │ trouble   │
  ┌─────▼──────────────────────────┐             │ todo-cmts │
  │ nvim/lsp/*.lua (per-server)    │             │ persist.  │
  │ clangd / pyright / ruff /      │             └───────────┘
  │ texlab / jdtls / rust_analyzer │
  └────────────────────────────────┘
```
