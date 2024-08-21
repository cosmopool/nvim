local setup = {
  fvm = true,
  ui = {
    border = "rounded",
    notification_style = "native",
  },
  decorations = {
    statusline = {
      app_version = false,
      device = false,
      project_config = false,
    }
  },
  root_patterns = { ".git", "pubspec.yaml" },
  debugger = {
    enabled = true,
    run_via_dap = true,
    -- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
    -- see |:help dap.set_exception_breakpoints()| for more info
    -- exception_breakpoints = {}
  },
  dev_log = {
    enabled = true,
    notify_errors = false,
    open_cmd = "tabedit",
  },
  widget_guides = {
    enabled = false,
  },
  -- closing_tags = {
  --   highlight = "ErrorMsg", -- highlight for the closing tag
  --   prefix = ">",           -- character to use for close tag e.g. > Widget
  --   enabled = true          -- set to false to disable
  -- },
  lsp = {
    color = {
      enabled = true,
      background = true,
      virtual_text = true,
      virtual_text_str = "■",
    },
    settings = {
      showTodos = true,
      renameFilesWithClasses = "always",
      completeFunctionCalls = true,
      enableSnippets = true,
      updateImportsOnRename = true,
      -- analysisExcludedFolders = {"<path-to-flutter-sdk-packages>"},
    },
  },
}

return {
  {
    "akinsho/flutter-tools.nvim",
    tag = "v1.12.0",
    event = "BufRead *.dart",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("flutter-tools").setup(setup)
    end,
  },
  {
    "nvim-lua/plenary.nvim",
    tag = "v0.1.4",
  },
  {
    "stevearc/dressing.nvim",
    tag = "v2.2.1",
  },
}
