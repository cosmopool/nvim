local config = {
  width = 130,
  autocmds = {
    -- When `true`, enables the plugin when you start Neovim.
    -- If the main window is  a side tree (e.g. NvimTree) or a dashboard, the command is delayed until it finds a valid window.
    -- The command is cleaned once it has successfuly ran once.
    -- When `safe`, debounces the plugin before enabling it.
    -- This is recommended if you:
    --  - use a dashboard plugin, or something that also triggers when Neovim is entered.
    --  - usually leverage commands such as `nvim +line file` which are executed after Neovim has been entered.
    enableOnVimEnter = true,
    -- When `true`, enables the plugin when you enter a new Tab.
    -- note: it does not trigger if you come back to an existing tab, to prevent unwanted interfer with user's decisions.
    enableOnTabEnter = false,
    -- When `true`, reloads the plugin configuration after a colorscheme change.
    reloadOnColorSchemeChange = true,
    -- When `true`, entering one of no-neck-pain side buffer will automatically skip it and go to the next available buffer.
    skipEnteringNoNeckPainBuffer = true,
  },

  integrations = {
    NeoTree = {
      position = "right",
      reopen = true,
    },
  }
}

return {
  "shortcuts/no-neck-pain.nvim",
  tag = "v2.5.3",
  config = function()
    require("no-neck-pain").setup(config)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "neo-tree",
        "undotree",
        "neotest-summary",
        "dbui",
        -- "dapui_*" TODO: turn when this is resolved: https://github.com/rcarriga/nvim-dap-ui/issues/329
        "dapui_scopes",
      },
      callback = function()
        if vim.bo.filetype == "neo-tree" then
          pcall(vim.cmd.UndotreeHide)
          pcall(vim.cmd.DBUIClose)
        elseif vim.bo.filetype == "undotree" then
          vim.cmd("Neotree close")
          pcall(vim.cmd.DBUIClose)
          -- fixes undotree width: https://github.com/mbbill/undotree/issues/143
          vim.api.nvim_win_set_width(vim.api.nvim_get_current_win(), vim.g.undotree_SplitWidth)
        elseif vim.bo.filetype == "dbui" then
          vim.cmd("Neotree close")
          pcall(vim.cmd.UndotreeHide)
          -- fixes dap ui width
          vim.api.nvim_win_set_width(vim.api.nvim_get_current_win(), vim.g.db_ui_winwidth)
        elseif string.find(vim.bo.filetype, "^dapui") then
          pcall(function()
            vim.cmd("Neotest summary close")
          end)
        elseif vim.bo.filetype == "neotest-summary" then
          -- TODO: this only works once because of https://github.com/rcarriga/nvim-dap-ui/issues/397
          require("dapui").close()
        end
      end,
    })
  end,
}
