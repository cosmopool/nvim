local function mason_lspconfig()
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
        require('lspconfig')[server_name].setup({})
      end,
    }
  })
end

return {
  {
    "williamboman/mason.nvim",
    tag = "v2.0.0",
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
    "williamboman/mason-lspconfig.nvim",
    tag = "v2.0.0",
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
  {
    "jay-babu/mason-nvim-dap.nvim",
    tag = "v2.5.1",
    opts = {
      ensure_installed = { "bash", "python", "codelldb" },
    },
  },
}
