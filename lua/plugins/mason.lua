local function mason_lspconfig()
  local lsp_zero = require('lsp-zero')

  require('mason-lspconfig').setup({
    ensure_installed = {
      "lua_ls",
      "zk",
      "vls",
      "zls",
      "lemminx",
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

      -- this is the "custom handler" for `jdtls`
      -- noop is an empty function that doesn't do anything
      -- dartls = lsp_zero.noop,
      lua_ls = function()
        require('lspconfig').lua_ls.setup({
          on_init = function(client)
            lsp_zero.nvim_lua_settings(client, {})
          end,
        })
      end,
      -- sourcekit = function()
      --   require('lspconfig').sourcekit.setup({
      --     capabilities = {
      --       workspace = {
      --         didChangeWatchedFiles = {
      --           dynamicRegistration = true,
      --         },
      --       },
      --     },
      --   })
      -- end
    }
  })
end
return {
  {
    "williamboman/mason.nvim",
    tag = "v1.10.0",
    opts = { PATH = "append" },
    build = function() pcall(vim.cmd, "MasonUpdate") end,
    config = function()
      require('mason').setup({})
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    tag = "v1.31.0",
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
    tag = "v2.4.0",
    opts = {
      ensure_installed = { "bash", "python", "codelldb" },
    },
  },
}
