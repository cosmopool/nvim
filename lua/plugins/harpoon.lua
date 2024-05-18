local config = function()
  -- local mark = require("harpoon.mark")
  -- local ui = require("harpoon.ui")
  --
  -- vim.keymap.set("n", "<leader>ha", mark.add_file)
  -- vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu)
  --
  -- -- vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
  -- vim.keymap.set("n", "<C-'>", function() ui.nav_file(1) end)
  -- vim.keymap.set("n", "<C-m>", function() ui.nav_file(2) end)
  -- vim.keymap.set("n", "<C-,>", function() ui.nav_file(3) end)
  -- vim.keymap.set("n", "<C-.>", function() ui.nav_file(4) end)
  -- vim.keymap.set("n", "<C-/>", function() ui.nav_file(5) end)

  local harpoon = require("harpoon")
  -- REQUIRED
  harpoon:setup()
  -- REQUIRED

  vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
  vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

  vim.keymap.set("n", "<C-'>", function() harpoon:list():select(1) end)
  vim.keymap.set("n", "<C-m>", function() harpoon:list():select(2) end)
  vim.keymap.set("n", "<C-,>", function() harpoon:list():select(3) end)
  vim.keymap.set("n", "<C-.>", function() harpoon:list():select(4) end)
  vim.keymap.set("n", "<C-/>", function() harpoon:list():select(5) end)
  vim.keymap.set("n", "<C-j>", function() harpoon:list():select(6) end)
  vim.keymap.set("n", "<C-k>", function() harpoon:list():select(7) end)
  vim.keymap.set("n", "<C-l>", function() harpoon:list():select(8) end)
  vim.keymap.set("n", "<C-;>", function() harpoon:list():select(9) end)

  -- Toggle previous & next buffers stored within Harpoon list
  vim.keymap.set("n", "<C-S-K>", function() harpoon:list():prev() end)
  vim.keymap.set("n", "<C-S-L>", function() harpoon:list():next() end)
end

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = config,
  commit = "0378a6c428a0bed6a2781d459d7943843f374bce",
}
