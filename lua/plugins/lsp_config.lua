---Enable and configure an LSP server
---@param server string The lsp server name
---@param opts? table The lsp server options to use
function setup(server, opts)
  if vim.fn.has("nvim-0.11") == 0 then
    require("lspconfig")[server].setup(opts)
    return
  end

  if not vim.tbl_isempty(opts) then
    vim.lsp.config(server, opts)
  end

  vim.lsp.enable(server)
end

local function config()
  ---Lsp servers to configure
  ---This is a table with name as first element and the options as second
  local servers = {
    dartls = {},
    clangd = {},
    bashls = {},
    cmake = {},
    gopls = {},
    jsonls = {},
    kotlin_language_server = {},
    lemminx = {},
    lua_ls = {},
    mesonlsp = {},
    pyright = {},
    ruby_lsp = {},
    rust_analyzer = {},
    sqlls = {},
    vls = {},
    yamlls = {},
    zk = {},
    zls = {},
  }

  local lspconfig = require("lspconfig")
  local blink = require("blink.cmp")

  for server, opts in pairs(servers) do
    opts.capabilities = blink.get_lsp_capabilities(opts.capabilities)
    lspconfig[server].setup(opts)
  end

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
    --   vim.keymap.set("n", "<leader>xl", require "xbase.pickers.builtin".actions, { desc = "XBase picker" })
    --   vim.keymap.set("n", "<leader>xk", function()
    --     require "xbase.logger".toggle(false, true)
    --   end, { desc = "XBase logger" })
    --   -- return on_attach(arg1, arg2)
    -- end,
  }
end

return {
  "neovim/nvim-lspconfig",
  tag = "v2.3.0",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "saghen/blink.cmp" },
  config = config,
}
