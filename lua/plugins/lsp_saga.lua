return {
  "glepnir/lspsaga.nvim",
  commit = "199eb00822f65b811f43736ba65ab7e16501125d",
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
