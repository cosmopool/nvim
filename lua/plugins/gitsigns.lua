local function config()
  local get_icon = require("core.utils").get_icon

  local setup = {
    signs = {
      add = { text = get_icon "GitSign" },
      change = { text = get_icon "GitSign" },
      delete = { text = get_icon "GitSign" },
      topdelete = { text = get_icon "GitSign" },
      changedelete = { text = get_icon "GitSign" },
      untracked = { text = get_icon "GitSign" },
    },
    auto_attach = true,
    current_line_blame = false,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol',
      delay = 300,
      ignore_whitespace = true,
      virt_text_priority = 100,
      use_focus = true,
    },
  }

  require("gitsigns").setup(setup)
end

return {
  "lewis6991/gitsigns.nvim",
  tag = "v0.9.0",
  enabled = vim.fn.executable "git" == 1,
  config = config,
  opts = {
    worktrees = vim.g.git_worktrees,
  },
}
