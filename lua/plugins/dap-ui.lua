local config = function()
  local imported, dapui = pcall(require, "dapui")
  if not imported then
    return
  end

  ---@diagnostic disable-next-line: redefined-local
  local imported, dap = pcall(require, "dap")
  if not imported then
    return
  end

  dapui.setup({
    layouts = {
      {
        elements = {
          {
            id = 'scopes',
            size = 0.35,
          },
          {
            id = 'watches',
            size = 0.25,
          },
          {
            id = 'breakpoints',
            size = 0.25,
          },
          {
            id = 'stacks',
            size = 0.15,
          },
        },
        position = 'left',
        size = 0.2,
      },
      {
        elements = {
          {
            id = 'repl',
            size = 0.8,
          },
          {
            id = 'console',
            size = 0.2,
          },
        },
        position = 'right',
        size = 0.35,
      },
    },

  })

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.after.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.after.event_exited["dapui_config"] = function()
    dapui.close()
  end
end

return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-dap", "folke/lazydev.nvim" },
    -- tag = "v4.0.0",
    commit = "a5606bc5958db86f8d92803bea7400ee26a8d7e4",
    event = "VeryLazy",
    config = config,
  },
}
