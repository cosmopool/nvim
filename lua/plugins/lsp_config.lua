-- local function clangd_setup()
--   return {
--     clangd = function(_, opts)
--       require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
--       return false
--     end,
--   }
-- end

local function clangd_opt()
  return {
    keys = {
      { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
    },
    root_dir = function(fname)
      return require("lspconfig.util").root_pattern(
        "Makefile",
        "configure.ac",
        "configure.in",
        "config.h.in",
        "meson.build",
        "meson_options.txt",
        "build.ninja"
      )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
        fname
      ) or require("lspconfig.util").find_git_ancestor(fname)
    end,
    capabilities = {
      offsetEncoding = { "utf-16" },
    },
    cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--header-insertion=iwyu",
      "--completion-style=detailed",
      "--function-arg-placeholders",
      "--fallback-style=llvm",
    },
    init_options = {
      usePlaceholders = true,
      completeUnimported = true,
      clangdFileStatus = true,
    },
  }
end

local function config()
  local lspconfig = require('lspconfig')
  lspconfig.kotlin_language_server.setup {}
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
    --   vim.keymap.set('n', '<leader>xl', require "xbase.pickers.builtin".actions, { desc = "XBase picker" })
    --   vim.keymap.set('n', '<leader>xk', function()
    --     require "xbase.logger".toggle(false, true)
    --   end, { desc = "XBase logger" })
    --   -- return on_attach(arg1, arg2)
    -- end,
  }
  -- lspconfig.clangd.setup(clangd_opt)
end

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  -- tag = "v1.0.0",
  config = config,
  -- opt = {
  --   servers = {
  --     clangd = clangd_opt
  --   },
  --   -- setup = {
  --   --   clangd = clangd_setup,
  --   -- },
  -- }
}
