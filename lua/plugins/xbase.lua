local function config()
  require 'xbase'.setup({
    --- Log level. Set it to ERROR to ignore everything
    log_level = vim.log.levels.DEBUG,
    log_buffer = {
      --- Whether toggling the buffer should auto focus to it?
      focus = false,
      --- Split Log buffer height
      height = 20,
      --- Vsplit Log buffer width
      width = 75,
      --- Default log buffer direction: { "horizontal", "vertical" }
      default_direction = "horizontal",
    },
    --- Options to be passed to lspconfig.nvim's sourcekit setup function.
    --- Setting this to {} is sufficient, However, it is strongly recommended to use on_attach key to setup custom mappings
    -- {
    --   cmd = { "sourcekit-lsp", "--log-level", "debug" },
    --   --- filetypes = { "swift" },
    --   --- root_dir = pattern("Package.swift", ".git", "project.yml", "Project.swift"),
    -- }
    -- sourcekit = {
    --   on_attach = require 'lspconfig'.on_attach(),
    --   handlers = require 'lspconfig'.handlers,
    --   capabilities = require 'lspconfig'.capabilities
    -- },
    --- Statusline provider configurations
    statusline = {
      watching = { icon = "", color = "#1abc9c" },
      device_running = { icon = "", color = "#4a6edb" },
      success = { icon = "", color = "#1abc9c" },
      failure = { icon = "", color = "#db4b4b" },
    },
    --- Simulators to only include.
    --- run `xcrun simctl list` to get a full list of available simulator
    --- If the list is empty then all simulator available  will be included
    -- simctl = {
    --   iOS = {
    --     "iPhone 16 Pro",
    --   },
    --   watchOS = {}, -- all available devices
    --   tvOS = {},    -- all available devices
    -- },
    --- Mappings
    mappings = {
      --- Whether xbase mapping should be disabled.
      enable = true,
      --- Open build picker. showing targets and configuration.
      build_picker = 0,
      --- Open run picker. showing targets, devices and configuration
      run_picker = 0,
      --- Open watch picker. showing run or build, targets, devices and configuration
      watch_picker = 0,
      --- A list of all the previous pickers
      all_picker = "<leader>xl",
      --- horizontal toggle log buffer
      toggle_split_log_buffer = "<leader>xs",
      --- vertical toggle log buffer
      toggle_vsplit_log_buffer = "<leader>xv",
    },
  })
end

return {
  'xbase-lab/xbase',
  build = 'make install',
  requires = {
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  config = config,
}
