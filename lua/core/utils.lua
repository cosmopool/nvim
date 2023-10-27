-- Keymap functions

local M = {}

function M.map(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, { silent = true })
end

function M.noremap(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

function M.exprnoremap(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true, expr = true })
end

-- Useful mode-specific shortcuts
-- nomenclature: "<expr?><mode><nore?>map(lhs, rhs)" where:
--      "expr?" optional expr option
--      "nore?" optional no-remap option
--      modes -> 'n' = NORMAL, 'i' = INSERT, 'x' = 'VISUAL', 'v' = VISUAL + SELECT, 't' = TERMINAL

function M.nmap(lhs, rhs)
	M.map("n", lhs, rhs)
end

function M.xmap(lhs, rhs)
	M.map("x", lhs, rhs)
end

function M.nnoremap(lhs, rhs)
	M.noremap("n", lhs, rhs)
end

function M.vnoremap(lhs, rhs)
	M.noremap("v", lhs, rhs)
end

function M.xnoremap(lhs, rhs)
	M.noremap("x", lhs, rhs)
end

function M.inoremap(lhs, rhs)
	M.noremap("i", lhs, rhs)
end

function M.tnoremap(lhs, rhs)
	M.noremap("t", lhs, rhs)
end

function M.exprnnoremap(lhs, rhs)
	M.exprnoremap("n", lhs, rhs)
end

function M.exprinoremap(lhs, rhs)
	M.exprnoremap("i", lhs, rhs)
end

function M.get_icon(kind, padding)
  if not M.icons then M.icons = require "core.icons" end
  local icon = M.icons and M.icons[kind]
  return icon and icon .. string.rep(" ", padding or 0) or ""
end

function M.is_available(plugin, print_debug, print_all_plugins)
  local lazy_config_available, lazy_config = pcall(require, "lazy.core.config")
  if print_debug then print(string.format("%s is available: %s", plugin, lazy_config_available and lazy_config.plugins[plugin] ~= nil)) end
  if print_all_plugins then print(vim.inspect(lazy_config.plugins)) end
  return lazy_config_available and lazy_config.plugins[plugin] ~= nil
end

--- Serve a notification with a title of "Hey!!"
---@param msg string The notification body
---@param type? number The type of the notification (:help vim.log.levels)
---@param opts? table The nvim-notify options to use (:help notify-options)
function M.notify(msg, type, opts)
  vim.schedule(function() vim.notify(msg, type, M.extend_tbl({ title = "Hey!!" }, opts)) end)
end

return M
