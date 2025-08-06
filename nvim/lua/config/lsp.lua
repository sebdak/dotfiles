vim.lsp.enable({ 'roslyn_ls', 'lua_ls', 'ts_ls' })

vim.diagnostic.config({
  virtual_text = { current_line = true }
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local bufmap = function(mode, rhs, lhs)
      vim.keymap.set(mode, rhs, lhs, { buffer = event.buf })
    end

    -- These keymaps are the defaults in Neovim v0.11
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    bufmap('n', 'gr', '<cmd>Telescope lsp_references<cr>')
    bufmap('n', 'gi', '<cmd>Telescope lsp_implementations<cr>')
    bufmap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>')
    bufmap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    bufmap('n', 'gO', '<cmd>lua vim.lsp.buf.document_symbol()<cr>')
    bufmap({ 'i', 's' }, '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

    -- These are custom keymaps
    bufmap('n', 'gd', '<cmd>Telescope lsp_definitions<cr>')
    bufmap('n', 'grt', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
    bufmap('n', 'grd', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    bufmap({ 'n', 'x' }, 'gq', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')

    vim.api.nvim_create_user_command('LspInfo', ':checkhealth vim.lsp', { desc = 'Alias to `:checkhealth vim.lsp`' })
    vim.api.nvim_create_user_command('LspLog', function()
      vim.cmd(string.format('tabnew %s', vim.lsp.get_log_path()))
    end, {
      desc = 'Opens the Nvim LSP client log.',
    })
  end,

})
