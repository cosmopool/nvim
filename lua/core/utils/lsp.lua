local M = {}

M.servers = {
  { "dartls",                 {} },
  { "clangd",                 {} },
  { "bashls",                 {} },
  { "clangd",                 {} },
  { "cmake",                  {} },
  { "gopls",                  {} },
  { "jsonls",                 {} },
  { "kotlin_language_server", {} },
  { "lemminx",                {} },
  { "lua_ls",                 {} },
  { "mesonlsp",               {} },
  { "pyright",                {} },
  { "ruby_lsp",               {} },
  { "rust_analyzer",          {} },
  { "sqlls",                  {} },
  -- { "vls", {} },
  { "yamlls",                 {} },
  { "zk",                     {} },
  { "zls",                    {} },
}


local function setup(server, opts)
  if vim.fn.has('nvim-0.11') == 0 then
    require('lspconfig')[server].setup(opts)
    return
  end

  if not vim.tbl_isempty(opts) then
    vim.lsp.config(server, opts)
  end

  vim.lsp.enable(server)
end

function M.setup_servers()
  for idx = 1, #M.servers do
    local name = M.servers[idx][1]
    local opts = M.servers[idx][2]
    setup(name, opts)
  end
end

return M
