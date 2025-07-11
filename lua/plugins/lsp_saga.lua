return {
  "glepnir/lspsaga.nvim",
  commit = "8efe00d6aed9db6449969f889170f1a7e43101a1",
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
