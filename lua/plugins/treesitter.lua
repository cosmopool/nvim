local opts = {
  ensure_installed = {
    "lua",
    "dart",
    "go",
    "json",
    "yaml",
    "v",
    "python",
    "swift",
    "c",
    "rust",
    "markdown_inline",
    "markdown",
  },
}

return {
  "nvim-treesitter/nvim-treesitter",
  tag = "v0.9.1",
  lazy = false,
  priority = 1000,
  opts = opts,
}
