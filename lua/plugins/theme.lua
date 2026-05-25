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
  vim.cmd.colorscheme('nordic')
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end

local function config_zenbones()
    vim.g.zenbones  = { transparent_background = true }
    -- vim.g.neobones  = { transparent_background = true }
    -- vim.g.vimbones  = { transparent_background = true }
    -- vim.g.rosebones = { transparent_background = true }
    -- vim.g.forestbones = { transparent_background = true }
    -- vim.g.nordbones = { transparent_background = true }
    -- vim.g.tokyobones = { transparent_background = true }
    -- vim.g.seoulbones = { transparent_background = true }
    -- vim.g.duckbones = { transparent_background = true }
    -- vim.g.zenburned = { transparent_background = true }
    -- vim.g.kanagawabones = { transparent_background = true }
    vim.cmd.colorscheme('zenbones')
    vim.o.background = 'dark'
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end

local function kanagawa()
    require("kanagawa-paper").setup({
     -- enable undercurls for underlined text
     undercurl = true,
     -- transparent background
     transparent = true,
     -- highlight background for the left gutter
     gutter = false,
     -- background for diagnostic virtual text
     diag_background = true,
     -- dim inactive windows. Disabled when transparent
     dim_inactive = true,
     -- set colors for terminal buffers
     terminal_colors = true,
     -- cache highlights and colors for faster startup.
     -- see Cache section for more details.
     cache = false,
    
     styles = {
      -- style for comments
      comment = { italic = true },
      -- style for functions
      functions = { italic = false },
      -- style for keywords
      keyword = { italic = false, bold = false },
      -- style for statements
      statement = { italic = false, bold = false },
      -- style for types
      type = { italic = false },
     },
     -- override default palette and theme colors
     colors = {
      palette = {},
      theme = {
       ink = {},
       canvas = {},
      },
     },
     -- adjust overall color balance for each theme [-1, 1]
     color_balance = {
      ink = { brightness = 0, saturation = 0 },
      canvas = { brightness = 0, saturation = 0 },
     },
     -- override highlight groups
     overrides = function(colors)
      return {}
     end,
    
     -- uses lazy.nvim, if installed, to automatically enable needed plugins
     auto_plugins = true,
     -- enable highlights for all plugins (disabled if using lazy.nvim)
     all_plugins = package.loaded.lazy == nil,
     -- manually enable/disable individual plugins.
     -- check the `groups/plugins` directory for the exact names
     plugins = {
      -- examples:
      -- rainbow_delimiters = true
      -- which_key = false
     },
    })
    vim.cmd.colorscheme("kanagawa-paper-ink")
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end

local function config_nord()
    require("nord").setup({
      transparent = true, -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
      diff = { mode = "bg" }, -- enables/disables colorful backgrounds when used in diff mode. values : [bg|fg]
      borders = true, -- Enable the border between verticaly split windows visible
      errors = { mode = "bg" }, -- Display mode for errors and diagnostics
                                -- values : [bg|fg|none]
      search = { theme = "vim" }, -- theme for highlighting search results
                                  -- values : [vim|vscode]
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = {},
        functions = {},
        variables = {},
    
        -- To customize lualine/bufferline
        bufferline = {
          current = {},
          modified = { italic = true },
        },
    
        lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
      },
    
      -- colorblind mode
      -- see https://github.com/EdenEast/nightfox.nvim#colorblind
      -- simulation mode has not been implemented yet.
      colorblind = {
        enable = false,
        preserve_background = false,
        severity = {
          protan = 0.0,
          deutan = 0.0,
          tritan = 0.0,
        },
      },
    
      -- Override the default colors
      ---@param colors Nord.Palette
      on_colors = function(colors) end,
    
      --- You can override specific highlights to use other groups or a hex color
      --- function will be called with all highlights and the colorScheme table
      ---@param colors Nord.Palette
      on_highlights = function(highlights, colors) end,
    })
    vim.cmd.colorscheme("nord")
end

local function config_boo()
    require("boo-colorscheme").use({
      theme = "boo",
      italic = true,
    })
    vim.cmd.colorscheme("boo")
end

return {
    {
      "zenbones-theme/zenbones.nvim",
      dependencies = "rktjmp/lush.nvim",
      lazy = false,
      priority = 1000,
      -- config = config_zenbones,
    },
    -- {
    --  "AlexvZyl/nordic.nvim",
    --   lazy = false,
    --   priority = 1000,
    --   -- config = config_nordic,
    -- },
    -- {
    --   "thesimonho/kanagawa-paper.nvim",
    --   lazy = false,
    --   priority = 1000,
    --   -- init = config_kanagawa,
    -- },
    -- {
    --   "gbprod/nord.nvim",
    --   lazy = false,
    --   priority = 1000,
    --   config = config_nord,
    -- },
    {
      "rockerBOO/boo-colorscheme-nvim",
      lazy = false,
      priority = 1000,
      config = config_boo,
    },
}
