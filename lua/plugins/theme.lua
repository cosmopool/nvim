local function config_nordic()
  local imported, theme = pcall(require, "nordic")
  if (not imported) then
    return
  end

  theme.setup({
    -- This callback can be used to override the colors used in the base palette.
    on_palette = function(palette) end,
    -- This callback can be used to override the colors used in the extended palette.
    after_palette = function(palette) end,
    -- This callback can be used to override highlights before they are applied.
    on_highlight = function(highlights, palette) end,
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
    swap_backgrounds = true,
    cursorline = {
      -- Bold font in cursorline.
      bold = false,
      -- Bold cursorline number.
      bold_number = true,
      -- Available styles: "dark", "light".
      theme = "light",
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
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = config_nordic,
  },
}
