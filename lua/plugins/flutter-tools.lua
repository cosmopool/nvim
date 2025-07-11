local setup = {
  fvm = true,
  root_patterns = { ".git", "pubspec.yaml" },
  ui = {
    border = "rounded",
    notification_style = "native",
  },
  decorations = {
    statusline = {
      app_version = false,
      device = true,
      project_config = true,
    }
  },
  debugger = {
    enabled = true,
    run_via_dap = true,
    -- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
    -- see |:help dap.set_exception_breakpoints()| for more info
    -- exception_breakpoints = {},
  },
  dev_log = {
    enabled = true,
    notify_errors = true,
    open_cmd = "tabedit",
  },
  widget_guides = {
    enabled = false,
  },
  closing_tags = {
    -- highlight = "ErrorMsg",
    prefix = "> ",
    enabled = true,
  },
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
    },
  },
}

return {
  {
    "akinsho/flutter-tools.nvim",
    tag = "v1.14.0",
    event = "BufRead *.dart",
    ft = "dart",
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
    tag = "v3.1.1",
  },
}
