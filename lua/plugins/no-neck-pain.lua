local config = {
  width = 120,
  integrations = {
    NeoTree = {
      position = "right",
      reopen = true,
    },
  }
}

return {
  "shortcuts/no-neck-pain.nvim",
  tag = "v2.1.5",
  config = function()
    require("no-neck-pain").setup(config)
  end,
}
