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

local function config_nordic()
  local imported, theme = pcall(require, "nordic")
  if (not imported) then
    return
  end

  theme.setup({
    -- This callback can be used to override the colors used in the base palette.
    -- on_palette = function(palette) end,
    -- This callback can be used to override the colors used in the extended palette.
    -- after_palette = function(palette) end,
    -- This callback can be used to override highlights before they are applied.
    -- on_highlight = function(highlights, palette) end,
    bold_keywords = true,
    italic_comments = true,
    transparent = {
      bg = true,
      float = true,
    },
    -- Enable brighter float border.
    bright_border = true,
    -- Reduce the overall amount of blue in the theme (diverges from base Nord).
    reduced_blue = true,
    -- Swap the dark background with the normal one.
    swap_backgrounds = false,
    cursorline = {
      -- Bold font in cursorline.
      bold = false,
      -- Bold cursorline number.
      bold_number = true,
      -- Available styles: "dark", "light".
      theme = "dark",
      -- Blending the cursorline bg with the buffer bg.
      blend = 0.85,
    },
    noice = {
      style = "classic", -- Available: `classic`, `flat`.
    },
    telescope = {
      style = "flat", -- Available: `classic`, `flat`.
    },
    leap = {
      dim_backdrop = false,
    },
    ts_context = {
      dark_background = true,
    }
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
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = config_nordic,
  },
}
