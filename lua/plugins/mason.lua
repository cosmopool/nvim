return {
  {
    "jay-babu/mason-null-ls.nvim",
    tag = "v2.6.0",
    dependencies = {
      {"williamboman/mason.nvim", tag = "v1.10.0"},
      "nvimtools/none-ls.nvim",
    },
    opts = {
      ensure_installed = {
        "shellcheck",
        "stylua",
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    tag = "v2.2.2",
    opts = {
      ensure_installed = {
        "bash",
        "python",
      },
    },
  },
}
