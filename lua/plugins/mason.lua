local function mason_lspconfig()
  local blink_capabilities = require("blink.cmp").get_lsp_capabilities()

  require('mason-lspconfig').setup({
    ensure_installed = {
      "lua_ls",
      "zk",
      "zls",
      "sqlls",
      "jsonls",
      "clangd",
      "cmake",
      "yamlls",
      --"omnisharp-mono",
      "pyright",
      "gopls",
      "bashls",
      "rust_analyzer",
      -- "sourcekit",
    },
    handlers = {
      -- this first function is the "default handler"
      -- it applies to every language server without a "custom handler"
      function(server_name)
        require('lspconfig')[server_name].setup({ capabilities = blink_capabilities })
      end,
    }
  })
end

return {
  {
    "mason-org/mason.nvim",
    tag = "v2.2.1",
    opts = { PATH = "append" },
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    tag = "v2.1.0",
    config = mason_lspconfig,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    tag = "v2.6.0",
    dependencies = {
      { "nvimtools/none-ls.nvim" },
    },
    opts = {
      ensure_installed = { "shellcheck", "stylua" },
    },
  },
}
