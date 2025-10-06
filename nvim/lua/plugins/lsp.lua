return {
  {
    'saghen/blink.cmp',
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = 'enter' },
      completion = {
        -- list = { selection = { preselect = false, auto_insert = false } },
      },
      signature = { enabled = true }
    }
  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  }
}
