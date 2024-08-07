vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

local keymap = vim.api.nvim_set_keymap
keymap("i", "jj", "<Esc>", {})

-- navigation
local opts = { noremap = true }
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- window resizing
keymap("n", "<M-j>", "<cmd>resize -2<cr>", opts)
keymap("n", "<M-k>", "<cmd>resize +2<cr>", opts)
keymap("n", "<M-h>", "<cmd>vertical resize -2<cr>", opts)
keymap("n", "<M-l>", "<cmd>vertical resize +2<cr>", opts)

-- move selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- cursor in the middle when half page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- cursor in the middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- dont drop middle buffer
vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
