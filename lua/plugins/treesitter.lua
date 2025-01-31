local setup = {
  ensure_installed = {
    "lua",
    "dart",
    "bash",
    "fish",
    "go",
    "json",
    "yaml",
    "v",
    "python",
    "c",
    "cpp",
    "rust",
    "markdown_inline",
    "markdown",
    "zig",
    "hyprlang",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

return {
  "nvim-treesitter/nvim-treesitter",
  -- commit = "58030e6d6f1d6609b43dcb765d54539dcc6a1a76",
  tag = "v0.9.3",
  lazy = false,
  priority = 1000,
  config = function()
    require("nvim-treesitter.configs").setup(setup)
  end,
}
