return {
  "nvim-treesitter/nvim-treesitter",

  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter.configs").setup({
      -- https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md
      ensure_installed = { 
        "cmake", "make",
        "asm", "c", "cpp", "rust", "go", "zig",
        "nix", "haskell", "scala",
        "python", "lua", "bash",
        "vim", "vimdoc" 
      },
      highlight = { 
        enable = true 
      },
    })
  end,
}
