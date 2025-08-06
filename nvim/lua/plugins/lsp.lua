return {
  {
    'saghen/blink.cmp',
    version = '1.*',
    opts = {
      keymap = { preset = 'enter' },
      completion = {
        -- list = { selection = { preselect = false, auto_insert = false } },
      },
    }
  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },
  {
    'seblyng/roslyn.nvim',
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
      -- your configuration comes here; leave empty for default settings
    },
  }
}
