local dap_config = function()
  local dap = require("dap")

  dap.adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb-dap",
    name = "lldb"
  }
  dap.configurations.zig = {
    {
      name = "Launch New Build",
      type = "lldb",
      request = "launch",
      program = "${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}",
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      args = {},
    }
  }
  dap.configurations.zig = {
    {
      name = "Launch",
      type = "lldb",
      request = "launch",
      program = "zig build run",
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

  local dapui = require("dapui")
  dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
  dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
  dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
end

local cmd_dap_config = function()
  require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
    sources = {
      { name = "dap" },
    },
  })

  local dap = require("dap")
  dap.adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb-dap",
    name = "lldb"
  }
  dap.configurations.zig = {
    {
      name = "Launch",
      type = "lldb",
      request = "launch",
      program = "${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}",
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      args = {},
    }
  }
end

local mason_dap_config = function()
  local mason_nvim_dap = require("mason-nvim-dap")
  mason_nvim_dap.setup()
end

return {
  "mfussenegger/nvim-dap",
  tag = "0.7.0",
  enabled = vim.fn.has("win32") == 0,
  dependencies = {
    "rcarriga/nvim-dap-ui",
    opts = { floating = { border = "rounded" } },
    config = dap_config,
  },
  {
    "rcarriga/cmp-dap",
    commit = "d16f14a210cd28988b97ca8339d504533b7e09a4",
    dependencies = { "nvim-cmp" },
    config = cmd_dap_config,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "nvim-dap" },
    tag = "v2.2.2",
    cmd = { "DapInstall", "DapUninstall" },
    --opts = { handlers = {} },
    config = mason_dap_config,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-dap", "folke/neodev.nvim" },
    tag = "v4.0.0",
    config = function() require("dapui").setup() end,
  },
  {
    "nvim-neotest/nvim-nio",
    tag = "v1.9.3",
  }
}
