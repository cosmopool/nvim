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

-- LSP ------------------------------
local lsp = require("core.utils.lsp")
lsp.setup_all()
