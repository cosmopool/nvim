vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
vim.api.nvim_set_hl(0, "DapBreakpointFG", { fg = "#D90000", bg = "#471615" })
vim.api.nvim_set_hl(0, "DapBreakpoint", { bg = "#471615" })
vim.api.nvim_set_hl(0, "DapStopped", { bg = "#154729" })

vim.fn.sign_define("DapBreakpoint", {
  text = "",
  texthl = "DapBreakpointFG",
  linehl = "DapBreakpoint",
  numhl =
  "DapBreakpoint"
})
vim.fn.sign_define("DapBreakpointCondition",
  { text = "ﳁ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" })
vim.fn.sign_define("DapBreakpointRejected",
  { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })
