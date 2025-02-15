vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- PLUGINS ----------------------------
local loaded_lazy, error = pcall(require, "core.lazy")
if not loaded_lazy then vim.api.nvim_err_writeln("Failed to load Lazy!\n\n" .. error) end
-- SETTINGS ---------------------------
if vim.loader then vim.loader.enable() end
require("core.options")
require("core.keymaps")
local imported, no_neck_pain = pcall(require, "no-neck-pain")
if imported then
  no_neck_pain.enable()
end
-- THEME ------------------------------
vim.cmd.colorscheme("onedark")
-- vim.cmd.colorscheme("cyberdream")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
