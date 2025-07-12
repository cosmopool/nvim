local M = {}

---Lsp servers to configure
---This is a table with name as first element and the options as second
M.servers = {
  { name = "dartls",                 opts = {}, },
  { name = "clangd",                 opts = {}, },
  { name = "bashls",                 opts = {}, },
  { name = "clangd",                 opts = {}, },
  { name = "cmake",                  opts = {}, },
  { name = "gopls",                  opts = {}, },
  { name = "jsonls",                 opts = {}, },
  { name = "kotlin_language_server", opts = {}, },
  { name = "lemminx",                opts = {}, },
  { name = "lua_ls",                 opts = {}, },
  { name = "mesonlsp",               opts = {}, },
  { name = "pyright",                opts = {}, },
  { name = "ruby_lsp",               opts = {}, },
  { name = "rust_analyzer",          opts = {}, },
  { name = "sqlls",                  opts = {}, },
  -- { name = "vls",                    opts = {}, },
  { name = "yamlls",                 opts = {}, },
  { name = "zk",                     opts = {}, },
  { name = "zls",                    opts = {}, },
}

---Enable and configure an LSP server
---@param server string The lsp server name
---@param opts? table The lsp server options to use
function M.setup(server, opts)
  if vim.fn.has('nvim-0.11') == 0 then
    require('lspconfig')[server].setup(opts)
    return
  end

  if not vim.tbl_isempty(opts) then
    vim.lsp.config(server, opts)
  end

  vim.lsp.enable(server)
end

---Enable and configure all LSP server listed in this module (**M.servers**) list
function M.setup_all()
  for idx = 1, #M.servers do
    local server = M.servers[idx]
    M.setup(server.name, server.opts)
  end
end

return M
