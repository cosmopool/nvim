local utils = require "core.utils"
local get_icon = utils.get_icon

local opts = {
  defaults = {
    git_worktrees = vim.g.git_worktrees,
    prompt_prefix = get_icon("Selected", 1),
    selection_caret = get_icon("Selected", 1),
    path_display = { "truncate" },
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = { prompt_position = "top", preview_width = 0.55 },
      vertical = { mirror = false },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
  },
}

local config = function()
  local telescope = require "telescope"
  telescope.setup(opts)
  local conditional_func = utils.conditional_func
  conditional_func(telescope.load_extension, pcall(require, "notify"), "notify")
  conditional_func(telescope.load_extension, pcall(require, "aerial"), "aerial")
  conditional_func(telescope.load_extension, utils.is_available("telescope-fzf-native.nvim", false, false), "fzf")
  conditional_func(telescope.load_extension, utils.is_available("flutter-tools", false, false), "flutter")
end

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.4",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable "make" == 1, build = "make" },
    { "nvim-lua/plenary.nvim" },
  },
  cmd = "Telescope",
  opts = opts,
  config = config,
}
