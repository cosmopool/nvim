local function next_with_selection(cmp, luasnip)
  return cmp.mapping(function(fallback)
    if cmp.visible() then
      if #cmp.get_entries() == 1 then
        cmp.confirm({ select = true })
      else
        cmp.select_next_item()
      end
    elseif luasnip.locally_jumpable(1) then
      luasnip.jump(1)
    else
      fallback()
    end
  end, { "i", "s" })
end

local function prev_with_selection(cmp, luasnip)
  return cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.locally_jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, { "i", "s" })
end

local function config()
  local luasnip = require("luasnip")
  local cmp = require('cmp')
  cmp.setup({
    sources = {
      { name = 'nvim_lsp' },
    },
    snippet = {
      expand = function(args)
        -- You need Neovim v0.10 to use vim.snippet
        vim.snippet.expand(args.body)
      end,
    },
    select = { behavior = cmp.SelectBehavior.Insert },
    mapping = cmp.mapping.preset.insert({
      ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
      ["<down>"] = next_with_selection(cmp, luasnip),
      ["<up>"] = prev_with_selection(cmp, luasnip),
    })
  })
end

return {
  "hrsh7th/nvim-cmp",
  tag = "v0.0.2",
  event = { "InsertEnter", "CmdlineEnter" },
  config = config,
}
