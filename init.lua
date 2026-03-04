vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true


-- PLUGINS ----------------------------
local loaded_lazy, error = pcall(require, "core.lazy")
if not loaded_lazy then vim.api.nvim_err_writeln("Failed to load Lazy!\n\n" .. error) end

-- SETTINGS ---------------------------
if vim.loader then vim.loader.enable() end
require("core.options")
require("core.keymaps")

-- THEME ------------------------------
vim.cmd.colorscheme("nordic")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- dap debugger colors
vim.api.nvim_set_hl(0, "DapBreakpointFG", { fg = "#D90000", bg = "#471615" })
vim.api.nvim_set_hl(0, "DapBreakpoint", { bg = "#471615" })
vim.api.nvim_set_hl(0, "DapStopped", { bg = "#154729" })
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpointFG", linehl = "DapBreakpoint", numhl = "DapBreakpoint" })
vim.fn.sign_define("DapBreakpointCondition", { text = "ﳁ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })

local lldb_dap_path = "/usr/bin/lldb-dap"
if vim.loop.os_uname().sysname == "Darwin" then
  lldb_dap_path = "/Applications/Xcode.app/Contents/Developer/usr/bin/lldb-dap"
end
local dap = require("dap")
dap.adapters.lldb = {
  type = "executable",
  command = lldb_dap_path,
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
  },
  {
    name = "Launch (default executable)",
    type = "lldb",
    request = "launch",
    program = "${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}",
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
  {
    name = "Debug tests (default executable)",
    type = "lldb",
    request = "launch",
    program = function()
      -- Compile current file tests
      local file = vim.fn.expand('%:p')
      os.execute("zig test -fno-strip -O Debug -femit-bin=.zig-cache/test-bin --test-no-exec " .. file)
      return "${workspaceFolder}/.zig-cache/test-bin/"
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  }
}

dap.configurations.c = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    runInTerminal = false,
  }
}
