return {
  {
    "williamboman/mason.nvim",
    tag = "v1.10.0",
    opts = { PATH = "append" },
    build = function() pcall(vim.cmd, "MasonUpdate") end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    tag = "v1.31.0",
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
      ensure_installed = { "bash", "python" },
    },
  },
}
