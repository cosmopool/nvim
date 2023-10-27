--- ### Utilities
--
-- Based on AstroNvim Utilities
-- https://github.com/AstroNvim/AstroNvim
-- @module astronvim.utils
-- @copyright 2022
-- @license GNU General Public License v3.0

local M = {}

-- Keymap functions
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


--- Get an icon if it is available and return it
---@param kind string The kind of icon in astronvim.icons to retrieve
---@param padding? integer Padding to add to the end of the icon
---@return string icon
function M.get_icon(kind, padding)
  if not M.icons then M.icons = require "core.icons" end
  local icon = M.icons and M.icons[kind]
  return icon and icon .. string.rep(" ", padding or 0) or ""
end

--- Check if a plugin is defined in lazy. Useful with lazy loading when a plugin is not necessarily loaded yet
---@param plugin string The plugin to search for
---@param print_result boolean Whether to print the result
---@param print_all_plugins boolean Print all plugins avilable
---@return boolean available # Whether the plugin is available
function M.is_available(plugin, print_result, print_all_plugins)
  local lazy_config_available, lazy_config = pcall(require, "lazy.core.config")
  if print_result then print(string.format("%s is available: %s", plugin, lazy_config_available and lazy_config.plugins[plugin] ~= nil)) end
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
