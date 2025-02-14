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

local function config_cyberdream()
  local imported, cyberdream = pcall(require, "cyberdream")
  if (not imported) then
    return
  end

  cyberdream.setup({
    -- Enable transparent background
    transparent = true,
    -- Modern borderless telescope theme - also applies to fzf-lua
    borderless_pickers = true,
    -- Replace all fillchars with ' ' for the ultimate clean look
    hide_fillchars = true,
    italic_comments = true,
    terminal_colors = true,
    cache = true,

    extensions = {
      alpha = true,
      blinkcmp = true,
      cmp = true,
      dashboard = true,
      fzflua = true,
      gitpad = true,
      gitsigns = true,
      grapple = true,
      grugfar = true,
      heirline = true,
      helpview = true,
      hop = true,
      indentblankline = true,
      kubectl = true,
      lazy = true,
      leap = true,
      markdown = true,
      markview = true,
      mini = true,
      noice = true,
      neogit = true,
      notify = true,
      rainbow_delimiters = true,
      telescope = true,
      treesitter = true,
      treesittercontext = true,
      trouble = true,
      whichkey = true,
    },
  })
end

return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = onedark_config,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = config_cyberdream,
  },
}
