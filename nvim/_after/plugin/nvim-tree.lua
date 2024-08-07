require("nvim-tree").setup({
  view = {
    width = 40,
  },
  filters = { custom = { "^.git$" } }
})

vim.keymap.set("n", "<c-n>", "<cmd>NvimTreeToggle<cr>", {})
vim.keymap.set("n", "<leader>r", "<cmd>NvimTreeFindFile<cr>", {})
