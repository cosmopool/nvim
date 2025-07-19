local dap_config = function()
  local found, dap = pcall(require, "dap")
  if not found then return end

  dap.adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb-dap",
    name = "lldb"
  }

  dap.configurations.zig = {
    {
      name = "Launch (build run)",
      type = "lldb",
      request = "launch",
      program = "zig build run",
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      args = {},
    }
  }

  dap.configurations.zig = {
    {
      name = "Launch (default executable)",
      type = "lldb",
      request = "launch",
      program = "${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}",
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      args = {},
    }
  }

  dap.configurations.go = {
    {
      type = "go",
      name = "(Arguments)",
      request = "launch",
      program = "dlv",
      cwd = "${workspaceFolder}",
      args = {},
      env = { LOG_COLOR = "0", },
    },
    {
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
    }
  }
end

local dap_ui_config = function()
  local found, dapui = pcall(require, "dapui")
  if not found then return end

  dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
  dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
  dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
end

local cmp_dap_config = function()
  local found, cmp = pcall(require, "cmp")
  if not found then return end

  cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
    sources = {
      { name = "dap" },
    },
  })
end

local mason_dap_config = function()
  local mason_nvim_dap = require("mason-nvim-dap")
  mason_nvim_dap.setup()
end

return {
  "mfussenegger/nvim-dap",
  tag = "0.10.0",
  enabled = vim.fn.has("win32") == 0,
  config = dap_config,
  dependencies = {
    "rcarriga/nvim-dap-ui",
    opts = { floating = { border = "rounded" } },
  },
  {
    "rcarriga/nvim-dap-ui",
    config = dap_ui_config,
  },
  -- {
  --   "rcarriga/cmp-dap",
  --   config = cmp_dap_config,
  -- },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "nvim-dap" },
    tag = "v2.5.1",
    cmd = { "DapInstall", "DapUninstall" },
    config = mason_dap_config,
  },
  {
    "nvim-neotest/nvim-nio",
    tag = "v1.10.1",
  }
}
