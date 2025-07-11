local config = {
  width = 130,
  integrations = {
    NeoTree = {
      position = "right",
      reopen = true,
    },
  }
}

return {
  "shortcuts/no-neck-pain.nvim",
  tag = "v2.4.5",
  config = function()
    require("no-neck-pain").setup(config)
  end,
}
