return {
  "github/copilot.vim",
  cmd = "Copilot",
  keys = {
    { "<leader>cp",  "<cmd>Copilot status<cr>",  "n",        "Enable Copilot" },
    { "<leader>cpe", "<cmd>Copilot enable<cr>",  "n",        "Enable Copilot" },
    { "<leader>cpd", "<cmd>Copilot disable<cr>", "n",        "Disable Copilot" },
    { "<M-]>",       false },
    { "<M-n>",       "<Plug>(copilot-next)",     mode = "i", "Copilot next suggestion" },
    { "<M-[",        false },
    { "<M-p>",       "<Plug>(copilot-previous)", mode = "i", "Copilot previous suggestion" },
    { "<C-y>",       "<Plug>(copilot-accept)",   mode = "i", "Copilot accept suggestion" },
  },
}
