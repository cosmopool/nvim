local function select_and_insert(cmp, luasnip)
  return cmp.mapping({
    i = function(fallback)
      if cmp.visible() and cmp.get_active_entry() then
        if luasnip.expandable() then
          luasnip.expand()
        else
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
        end
      else
        fallback()
      end
    end,
    s = cmp.mapping.confirm({ select = true }),
    c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
  })
end

local function next_with_selection(cmp, luasnip)
  return cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
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
      ["<CR>"] = select_and_insert(cmp, luasnip),
      ["<down>"] = next_with_selection(cmp, luasnip),
      ["<up>"] = prev_with_selection(cmp, luasnip),
    })
  })
end

return {
  "hrsh7th/nvim-cmp",
  commit = "ca4d3330d386e76967e53b85953c170658255ecb",
  event = { "InsertEnter", "CmdlineEnter" },
  -- opts = function(_, opts)
  --   opts.sources = opts.sources or {}
  --   table.insert(opts.sources, {
  --     name = "lazydev",
  --     group_index = 0, -- set group index to 0 to skip loading LuaLS completions
  --   })
  -- end,
  config = config,
}
