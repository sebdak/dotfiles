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
  }
}
