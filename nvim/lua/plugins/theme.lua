return {
  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000,
  config = function()
    vim.opt.background = 'dark'
    vim.cmd [[let g:gruvbox_material_background = 'hard']]
    vim.cmd [[let g:gruvbox_material_palette = 'mix']]
    vim.cmd [[let g:airline_theme = 'gruvbox_material']]
    vim.cmd.colorscheme("gruvbox-material")
  end,
}
