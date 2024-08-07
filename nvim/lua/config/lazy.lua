-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    -- { import = "plugins" },
    {
      "sainnhe/gruvbox-material",
      lazy = false,    -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
        -- load the colorscheme here
        vim.opt.background = 'dark'
        vim.cmd [[let g:gruvbox_material_background = 'hard']]
        vim.cmd [[let g:gruvbox_material_palette = 'mix']]
        vim.cmd [[let g:airline_theme = 'gruvbox_material']]
        vim.cmd.colorscheme("gruvbox-material")
      end,
    },
    {
      "goolord/alpha-nvim",
      config = function()
        require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
      end
    },
    { "tpope/vim-surround" },
    { "tpope/vim-commentary" },
    { "airblade/vim-gitgutter" },
    { "christoomey/vim-tmux-navigator" },
    { "mbbill/undotree" },
    { "iamcco/markdown-preview.nvim",    lazy = true },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    {
      "nvim-telescope/telescope.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim"
      },
      init = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>g', builtin.git_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      end
    },
    {
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
      init = function()
        vim.keymap.set("n", "<c-n>", "<cmd>NvimTreeToggle<cr>", {})
        vim.keymap.set("n", "<leader>r", "<cmd>NvimTreeFindFile<cr>", {})
      end
    }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
