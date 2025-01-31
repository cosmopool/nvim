local function config()
  local lspconfig = require('lspconfig')
  lspconfig.kotlin_language_server.setup {}
  lspconfig.sourcekit.setup {
    capabilities = {
      workspace = {
        didChangeWatchedFiles = {
          dynamicRegistration = true,
        },
      },
    },
    filetypes = { "swift" },
    root_dir = lspconfig.util.root_pattern("*.xcodeproj", "*.xcworkspace", "Package.swift", ".git", "project.yml", "Project.swift"),
    -- on_attach = function(arg1, arg2)
    --   vim.keymap.set('n', '<leader>xl', require "xbase.pickers.builtin".actions, { desc = "XBase picker" })
    --   vim.keymap.set('n', '<leader>xk', function()
    --     require "xbase.logger".toggle(false, true)
    --   end, { desc = "XBase logger" })
    --   -- return on_attach(arg1, arg2)
    -- end,
  }
end

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  -- tag = "v1.0.0",
  config = config,
}
