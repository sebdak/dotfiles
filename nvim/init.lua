require("remap")
require("plugins")

-- NvimTree specific
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- BASIC SETTINGS
vim.opt.showmode = true
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.wrap = false
vim.opt.mouse = "a"
vim.opt.hidden = true
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- automatically switch to case sensitive when search query contains an uppcase letter
vim.opt.scrolloff = 8
vim.opt.showcmd = true
vim.opt.encoding = "UTF-8"
vim.opt.errorbells = false
vim.opt.visualbell = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.updatetime = 50
vim.opt.ma = true
vim.opt.hlsearch = false -- turn off search highlighting
vim.opt.maxmempattern = 5000 -- for large files e.g. base64 encoded ones
vim.opt.fo:remove("c") -- Dont comment new lines after commented line
vim.opt.fo:remove("r") -- Dont comment new lines after commented line
vim.opt.fo:remove("o") -- Dont comment new lines after commented line
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes" -- Always show gutter

vim.g.completeopts = "menu,menuone,oneselect,noinsert"
vim.g.closetag_filenames = "*.html,*.tsx,*.jsx"
