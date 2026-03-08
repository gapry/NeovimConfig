return {
  "nvim-treesitter/nvim-treesitter",

  build = ":TSUpdate",

  -- https://github.com/nvim-lua/kickstart.nvim/pull/1748/changes
  main = "nvim-treesitter.config",

  opts = {
    -- https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md
    ensure_installed = {
      "cmake", "make",
      "asm", "c", "cpp", "rust", "go", "zig",
      "nix", "haskell", "scala",
      "python", "lua", "bash",
      "vim", "vimdoc"
    },
    highlight = {
      enable = true,
    },
  },
}
