---------- VISUAL ----------
vim.o.conceallevel       = 0                             -- Don"t hide quotes in markdown
vim.o.cmdheight          = 1
vim.o.pumheight          = 10
vim.o.showmode           = false
vim.o.showtabline        = 2                             -- Always show tabline
vim.o.title              = true
vim.o.termguicolors      = true                          -- Use true colors, required for some plugins
vim.o.guicursor          = "i-n-v-c-sm:block,ci-ve:ver25,r-cr-o:hor20"
vim.wo.number            = true
vim.wo.relativenumber    = true
vim.wo.cursorline        = true
vim.o.signcolumn         = 'yes'

---------- BEHAVIOUR ----------
vim.o.hlsearch           = true
vim.o.ignorecase         = false                          -- Ignore case when using lowercase in search
vim.o.smartcase          = true                          -- But don"t ignore it when using upper case
vim.o.smarttab           = true
vim.o.smartindent        = true
vim.o.expandtab          = true                          -- Convert tabs to spaces.
vim.o.tabstop            = 2
vim.o.softtabstop        = 2
vim.o.shiftwidth         = 2
vim.o.splitbelow         = true
vim.o.splitright         = true
vim.o.scrolloff          = 12                            -- Minimum offset in lines to screen borders
vim.o.sidescrolloff      = 8
vim.o.exrc               = true
vim.o.secure             = true
-- vim.o.mouse              = "a"

---------- VIM SPECIFIC ----------
vim.o.hidden             = true                          -- Do not save when switching buffers
vim.o.fileencoding       = "utf-8"
vim.o.spell              = false
vim.o.spelllang          = "en_us"
vim.o.completeopt      = "menu,menuone,noselect"
vim.o.wildmode           = "longest,full"                -- Display auto-complete in Command Mode
vim.o.updatetime         = 300                           -- Delay until write to Swap and HoldCommand event

-- Disable default plugins
-- vim.g.loaded_netrwPlugin = false

-- Providers
-- vim.g.python3_host_prog  = "/home/milton/software/miniconda/envs/pynvim/bin/python"
