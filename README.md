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

## Plugins

### LSP & Completion

| Plugin                                                                       | Purpose                                                                                       |
| ---------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| [mason.nvim](https://github.com/williamboman/mason.nvim)                     | Installs LSP servers / DAP adapters (clangd, pyright, ruff, texlab, jdtls, codelldb, debugpy) |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Bridges mason and lspconfig, auto-enables installed servers                                   |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)                   | Base LSP client configurations                                                                |
| [blink.cmp](https://github.com/saghen/blink.cmp)                             | Autocompletion (LSP / path / snippets / buffer)                                               |
| [rustaceanvim](https://github.com/mrcjkb/rustaceanvim)                       | Rust: rust-analyzer + clippy, runnables, debuggables, error explanations                      |
| [conform.nvim](https://github.com/stevearc/conform.nvim)                     | Formatting: clang-format, rustfmt, ruff, stylua                                               |
| [trouble.nvim](https://github.com/folke/trouble.nvim)                        | Project-wide diagnostics list                                                                 |

### Debugging

| Plugin                                                                 | Purpose                                                  |
| ---------------------------------------------------------------------- | -------------------------------------------------------- |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap)                   | Debug Adapter Protocol client                            |
| [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)                 | Debugger UI (scopes, stacks, breakpoints, watches, repl) |
| [mason-nvim-dap.nvim](https://github.com/jay-babu/mason-nvim-dap.nvim) | Auto-installs codelldb (C/C++/Rust) and debugpy          |

### Editing

| Plugin                                                                                        | Purpose                                                               |
| --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)                         | Syntax-aware highlighting (main branch, started via FileType autocmd) |
| [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) | Function/class textobjects and motions                                |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs)                                    | Auto-close brackets and quotes                                        |
| [vimtex](https://github.com/lervag/vimtex)                                                    | LaTeX editing, build via texlab + zathura preview                     |

### UI & Navigation

| Plugin                                                            | Purpose                                         |
| ----------------------------------------------------------------- | ----------------------------------------------- |
| [catppuccin](https://github.com/catppuccin/nvim)                  | Colorscheme (mocha)                             |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)      | Statusline: LSP status, diagnostics, git branch |
| [which-key.nvim](https://github.com/folke/which-key.nvim)         | Popup showing available keybindings             |
| [fzf-lua](https://github.com/ibhagwan/fzf-lua)                    | Fuzzy finder: files, grep, buffers, LSP symbols |
| [oil.nvim](https://github.com/stevearc/oil.nvim)                  | File explorer as an editable buffer             |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)       | Git hunk signs, stage/reset, blame              |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlight and search TODO/FIXME comments        |
| [persistence.nvim](https://github.com/folke/persistence.nvim)     | Session management (auto-restore per directory) |

### AI

| Plugin                                                         | Purpose                                                                   |
| -------------------------------------------------------------- | ------------------------------------------------------------------------- |
| [copilot.vim](https://github.com/github/copilot.vim)           | GitHub Copilot inline suggestions (disabled by default, toggle on demand) |
| [opencode.nvim](https://github.com/nickjvandyke/opencode.nvim) | OpenCode AI assistant integration                                         |

## Shortcuts

Leader key: `<Space>`

### General

| Key           | Action               |
| ------------- | -------------------- |
| `<C-h/j/k/l>` | Move between windows |
| `<leader>q`   | Save all and quit    |
| `<leader>f`   | Format buffer        |

### Find (fzf-lua)

| Key           | Action                 |
| ------------- | ---------------------- |
| `<leader>pf`  | Find files             |
| `<leader>ps`  | Live grep project      |
| `<leader>pw`  | Grep word under cursor |
| `<leader>pb`  | Find buffers           |
| `<leader>pr`  | Recent files           |
| `<leader>pl`  | Buffer lines           |
| `<leader>pg`  | Git changed files      |
| `<leader>pt`  | Find TODO comments     |
| `<leader>pp`  | Resume last search     |
| `<leader>psy` | LSP document symbols   |
| `<leader>psw` | LSP workspace symbols  |

### LSP

| Key          | Action                       |
| ------------ | ---------------------------- |
| `K`          | Hover documentation          |
| `gd`         | Go to definition             |
| `gr`         | Find references              |
| `gb` / `gf`  | Jump back / forward          |
| `<leader>rn` | Rename symbol                |
| `<leader>ca` | Code action                  |
| `<leader>d`  | Show diagnostic float        |
| `<leader>ih` | Toggle inlay hints           |
| `<leader>ch` | Switch source/header (C/C++) |

### Diagnostics (trouble)

| Key          | Action              |
| ------------ | ------------------- |
| `<leader>xx` | Project diagnostics |
| `<leader>xb` | Buffer diagnostics  |
| `<leader>xq` | Quickfix list       |

### Rust (rustaceanvim)

| Key          | Action        |
| ------------ | ------------- |
| `<leader>rr` | Runnables     |
| `<leader>rd` | Debuggables   |
| `<leader>re` | Explain error |

### Debug (nvim-dap)

| Key         | Action            |
| ----------- | ----------------- |
| `<leader>b` | Toggle breakpoint |
| `<F5>`      | Start / continue  |
| `<F10>`     | Step over         |
| `<F11>`     | Step into         |
| `<F12>`     | Step out          |

### Git (gitsigns)

| Key          | Action               |
| ------------ | -------------------- |
| `]h` / `[h`  | Next / previous hunk |
| `<leader>hs` | Stage hunk           |
| `<leader>hr` | Reset hunk           |
| `<leader>hp` | Preview hunk         |
| `<leader>hb` | Blame line           |

### File Explorer (oil)

| Key                         | Action                       |
| --------------------------- | ---------------------------- |
| `-` / `<leader>e`           | Open parent directory        |
| `<leader>fe`                | Explorer at current file     |
| `<leader>E`                 | Explorer at project root     |
| `<CR>`                      | Open entry                   |
| `<C-s>` / `<C-h>` / `<C-t>` | Open in vsplit / split / tab |
| `<C-p>`                     | Preview                      |
| `g.`                        | Toggle hidden files          |
| `q`                         | Close                        |

### Textobjects (treesitter)

| Key         | Action                        |
| ----------- | ----------------------------- |
| `af` / `if` | Select outer / inner function |
| `ac` / `ic` | Select outer / inner class    |
| `]f` / `[f` | Next / previous function      |

### Completion (blink.cmp, insert mode)

| Key                 | Action                           |
| ------------------- | -------------------------------- |
| `<Tab>` / `<S-Tab>` | Next / previous item             |
| `<CR>`              | Accept                           |
| `<C-Space>`         | Show menu / toggle documentation |

### Session (persistence)

| Key          | Action                     |
| ------------ | -------------------------- |
| `<leader>ss` | Restore session (cwd)      |
| `<leader>sl` | Restore last session       |
| `<leader>sd` | Don't save current session |

### LaTeX (vimtex)

| Key          | Action                |
| ------------ | --------------------- |
| `<leader>lv` | View PDF              |
| `<leader>lc` | Clean auxiliary files |

### AI

| Key              | Action                    |
| ---------------- | ------------------------- |
| `<leader>ce`     | Toggle Copilot            |
| `<C-L>` (insert) | Accept Copilot suggestion |
| `<leader>oc`     | OpenCode: ask AI          |
| `<leader>ox`     | OpenCode: actions         |
| `<leader>oo`     | OpenCode: toggle window   |

