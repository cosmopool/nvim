local onedark_config = function()
  require('onedark').setup {
    style = 'darker',
    transparent = true,
    term_colors = true,
    ending_tildes = false,
    cmp_itemkind_reverse = false,
    -- toggle theme style ---
    toggle_style_key = "<leader>ts",
    toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' },
    -- Change code style ---
    -- Options are italic, bold, underline, none
    code_style = {
      comments = 'italic',
      keywords = 'italic,bold',
      functions = 'none',
      strings = 'none',
      variables = 'none'
    },
    -- Lualine options --
    lualine = {
      transparent = true, -- lualine center bar transparency
    },
    -- Custom Highlights --
    colors = {},     -- Override default colors
    highlights = {}, -- Override highlight groups
    -- Plugins Config --
    diagnostics = {
      darker = true,
      undercurl = true,
      background = true,
    },
  }
end

return {
  {
    "bluz71/vim-moonfly-colors",
    commit = "7b0040a86b200cc20f9a12300e3871ddab703e29",
    name = "moonfly",
    lazy = false,
    priority = 1000,
  },
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = onedark_config,
  },
}
