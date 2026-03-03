return {
  "glepnir/lspsaga.nvim",
  commit = "562d9724e3869ffd1801c572dd149cc9f8d0cc36",
  event = "BufRead",
  lazy = true,
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-treesitter/nvim-treesitter" }
  },
  config = function()
    require("lspsaga").setup({
      code_action = {
        extend_gitsigns = true,
      },
    })
  end,
}
