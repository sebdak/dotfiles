return {
  "kyazdani42/nvim-tree.lua",
  dependencies = {
    "kyazdani42/nvim-web-devicons"
  },
  opts = {
    view = {
      width = 40,
    },
    filters = { custom = { "^.git$" } }
  },
  keys = {
    { "<C-n>",     "<cmd>NvimTreeToggle<cr>",   "n", "Toggle nvim tree" },
    { "<leader>r", "<cmd>NvimTreeFindFile<cr>", "n", "Locate in file tree" },
  }
}
