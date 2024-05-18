return {
  "glepnir/lspsaga.nvim",
  commit = "d65619007ab4cf1b7c4ade916d8fa648b67487d7",
  event = "BufRead",
  lazy = true,
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-treesitter/nvim-treesitter" }
  },
  config = function()
    require("lspsaga").setup({})
  end,
}
