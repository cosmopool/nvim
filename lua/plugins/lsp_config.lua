local config = function()
  local lsp = require("lsp-zero").preset({})

  lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
  end)

  local lspconfig = require("lspconfig")
  lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
  lspconfig.sourcekit.setup({
    capabilities = {
      workspace = {
        didChangeWatchedFiles = {
          dynamicRegistration = true,
        },
      },
    },
  })
end

return {
  "neovim/nvim-lspconfig",
  tag = "v1.0.0",
  config = config
}
