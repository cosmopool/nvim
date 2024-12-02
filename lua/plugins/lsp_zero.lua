local setup_func = function()
  -- Add cmp_nvim_lsp capabilities settings to lspconfig
  -- This should be executed before you configure any language server
  local lspconfig = require('lspconfig')
  local lspconfig_defaults = lspconfig.util.default_config
  lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
  )

  -- You'll find a list of language servers here:
  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
  -- These are example language servers.
  -- lspconfig.dartls.setup({})
  -- lspconfig.lua_ls.setup({})
  -- lspconfig.zls.setup({})
  -- lspconfig.sqlls.setup({})
  -- lspconfig.jsonls.setup({})
  -- lspconfig.clangd.setup({})
  -- lspconfig.cmake.setup({})
  -- lspconfig.yamlls.setup({})
  -- lspconfig.pyright.setup({})
  -- lspconfig.gopls.setup({})
  -- lspconfig.bashls.setup({})
  -- lspconfig.zk.setup({})
  -- lspconfig.vls.setup({})
  -- lspconfig.rust_analyzer.setup({})
  -- lspconfig.omnisharp-mono.setup({})
  -- lspconfig.lemminx.setup({})
end

return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v4.x",
  name = "lsp-zero",
  lazy = false,
  priority = 1000,
  dependencies = {
    -- Autocompletion
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },
  },
  config = setup_func
}
