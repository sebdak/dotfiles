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

require("lazy").setup({
  spec = {
    { import = "plugins" },
    { "tpope/vim-surround" },
    { "tpope/vim-commentary" },
    { "airblade/vim-gitgutter" },
    { "christoomey/vim-tmux-navigator" },
    {
      "echasnovski/mini.pairs",
      version = '*',
      config = function()
        require('mini.pairs').setup()
      end,
    },
    {
      "windwp/nvim-ts-autotag",
      config = function()
        require('nvim-ts-autotag').setup()
      end
    },
    {
      "goolord/alpha-nvim",
      config = function()
        require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
      end
    }
  },
  install = { colorscheme = { "gruvbox" } },
  checker = { enabled = false },
})
