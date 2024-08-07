return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  keys = function()
    local builtin = require('telescope.builtin')
    return {
      { "<leader>ff", builtin.find_files, "n", "Find files" },
      { "<leader>g",  builtin.git_files,  "n", "Git files" },
      { "<leader>fg", builtin.live_grep,  "n", "Live grep" },
      { "<leader>fb", builtin.buffers,    "n", "Buffers" },
      { "<leader>fh", builtin.help_tags,  "n", "Help tags" },
    }
  end
}
