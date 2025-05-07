local utils = require("core.utils")
local get_icon = utils.get_icon

local global_commands = {
  system_open = function(state)
    (vim.ui.open or require("astronvim.utils").system_open)(state.tree:get_node():get_id())
  end,
  parent_or_close = function(state)
    local node = state.tree:get_node()
    if (node.type == "directory" or node:has_children()) and node:is_expanded() then
      state.commands.toggle_node(state)
    else
      require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
    end
  end,
  child_or_open = function(state)
    local node = state.tree:get_node()
    if node.type == "directory" or node:has_children() then
      if not node:is_expanded() then -- if unexpanded, expand
        state.commands.toggle_node(state)
      else                           -- if expanded and has children, seleect the next child
        require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
      end
    else -- if not a directory just open it
      state.commands.open(state)
    end
  end,
  copy_selector = function(state)
    local node = state.tree:get_node()
    local filepath = node:get_id()
    local filename = node.name
    local modify = vim.fn.fnamemodify

    local vals = {
      ["BASENAME"] = modify(filename, ":r"),
      ["EXTENSION"] = modify(filename, ":e"),
      ["FILENAME"] = filename,
      ["PATH (CWD)"] = modify(filepath, ":."),
      ["PATH (HOME)"] = modify(filepath, ":~"),
      ["PATH"] = filepath,
      ["URI"] = vim.uri_from_fname(filepath),
    }

    local options = vim.tbl_filter(function(val) return vals[val] ~= "" end, vim.tbl_keys(vals))
    if vim.tbl_isempty(options) then
      utils.notify("No values to copy", vim.log.levels.WARN)
      return
    end
    table.sort(options)
    vim.ui.select(options, {
      prompt = "Choose to copy to clipboard:",
      format_item = function(item) return ("%s: %s"):format(item, vals[item]) end,
    }, function(choice)
      local result = vals[choice]
      if result then
        utils.notify(("Copied: `%s`"):format(result))
        vim.fn.setreg("+", result)
      end
    end)
  end,
  find_in_dir = function(state)
    local node = state.tree:get_node()
    local path = node:get_id()
    require("telescope.builtin").find_files {
      cwd = node.type == "directory" and path or vim.fn.fnamemodify(path, ":h"),
    }
  end,
}

local setup = {
  auto_clean_after_session_restore = true,
  close_if_last_window = true,
  enable_diagnostics = true,
  enable_git_status = true,
  sort_case_insensitive = true,
  sources = { "filesystem", "buffers", "git_status" },
  source_selector = {
    winbar = true,
    content_layout = "center",
    sources = {
      { source = "filesystem",  display_name = get_icon("FolderClosed", 1) .. "File" },
      { source = "buffers",     display_name = get_icon("DefaultFile", 1) .. "Bufs" },
      { source = "git_status",  display_name = get_icon("Git", 1) .. "Git" },
      { source = "diagnostics", display_name = get_icon("Diagnostic", 1) .. "Diagnostic" },
    },
  },
  default_component_configs = {
    indent = { padding = 0 },
    icon = {
      folder_closed = get_icon "FolderClosed",
      folder_open = get_icon "FolderOpen",
      folder_empty = get_icon "FolderEmpty",
      folder_empty_open = get_icon "FolderEmpty",
      default = get_icon "DefaultFile",
    },
    commands = global_commands,
    modified = { symbol = get_icon "FileModified" },
    git_status = {
      symbols = {
        added = get_icon "GitAdd",
        deleted = get_icon "GitDelete",
        modified = get_icon "GitChange",
        renamed = get_icon "GitRenamed",
        untracked = get_icon "GitUntracked",
        ignored = get_icon "GitIgnored",
        unstaged = get_icon "GitUnstaged",
        staged = get_icon "GitStaged",
        conflict = get_icon "GitConflict",
      },
    },
  },
  window = {
    width = 35,
    position = "right",
    mappings = {
      ["<space>"] = false, -- disable space until we figure out which-key disabling
      l = false,
      ["[b"] = "prev_source",
      ["]b"] = "next_source",
      F = utils.is_available("telescope.nvim", false, false) and "find_in_dir" or nil,
      O = "system_open",
      Y = "copy_selector",
      h = "parent_or_close",
      u = "child_or_open",
      o = "open",
      ["?"] = "show_help",
    },
    fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
      ["<C-k>"] = "move_cursor_down",
      ["<C-l>"] = "move_cursor_up",
    },
  },
  commands = global_commands,
  filesystem = {
    follow_current_file = { enabled = true },
    hijack_netrw_behavior = "open_current",
    use_libuv_file_watcher = true,
  },
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function(_) vim.opt_local.signcolumn = "auto" end,
    },
    {
      event = "file_opened",
      handler = function(_)
        require("neo-tree.command").execute({ action = "close" })
      end
    },
  },
}

return {}

-- return {
--   "nvim-neo-tree/neo-tree.nvim",
--   tag = "3.27",
--   dependencies = {
--     { "nvim-lua/plenary.nvim" },
--     { "nvim-tree/nvim-web-devicons", commit = "6b53401918a9033a41159d012160c5fb5eb249ae" },
--     { "MunifTanjim/nui.nvim",        tag = "0.3.0" },
--   },
--   config = function()
--     vim.fn.sign_define("DiagnosticSignError",
--       { text = " ", texthl = "DiagnosticSignError" })
--     vim.fn.sign_define("DiagnosticSignWarn",
--       { text = " ", texthl = "DiagnosticSignWarn" })
--     vim.fn.sign_define("DiagnosticSignInfo",
--       { text = " ", texthl = "DiagnosticSignInfo" })
--     vim.fn.sign_define("DiagnosticSignHint",
--       { text = "󰌵", texthl = "DiagnosticSignHint" })
--     require("neo-tree").setup(setup)
--     vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
--   end,
-- }
