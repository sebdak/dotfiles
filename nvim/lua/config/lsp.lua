vim.lsp.enable({ 'roslyn_ls', 'lua_ls', 'ts_ls', 'gopls' })

vim.diagnostic.config({
  virtual_text = { current_line = true },
  severity_sort = true,
  signs = { priority = 1 }
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = event.buf })
    vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', { buffer = event.buf })
    vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', { buffer = event.buf })
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', { buffer = event.buf })
    vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', { buffer = event.buf })
    vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', { buffer = event.buf })
    vim.keymap.set('n', "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

    vim.api.nvim_create_user_command('LspInfo', ':checkhealth vim.lsp', { desc = 'Alias to `:checkhealth vim.lsp`' })
    vim.api.nvim_create_user_command('LspLog', function()
      vim.cmd(string.format('tabnew %s', vim.lsp.get_log_path()))
    end, {
      desc = 'Opens the Nvim LSP client log.',
    })
    vim.api.nvim_create_user_command('LspRestart', function()
      for _, client in pairs(vim.lsp.get_clients({ bufnr = event.buf })) do
        vim.lsp.stop_client(client.id)
        vim.defer_fn(function()
          vim.lsp.start(client.config)
          vim.cmd('edit')
        end, 500)
      end
    end, {
      desc = 'Restarts the LSP client(s) attached to the current buffer.',
    })
  end,

})
