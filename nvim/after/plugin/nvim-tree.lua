require("nvim-tree").setup({})

vim.keymap.set("n", "<c-n>", "<cmd>NvimTreeToggle<cr>", {})
vim.keymap.set("n", "<leader>r", "<cmd>NvimTreeFindFile<cr>", {})
