return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')
    dapui.setup()

    vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = 'Toggle DAP UI' })
    vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'DAP: Continue' })
    vim.keymap.set('n', '<leader>dt', dap.terminate, { desc = 'DAP: Terminate' })
    vim.keymap.set('n', '<leader>dso', dap.step_over, { desc = 'DAP: Step Over' })
    vim.keymap.set('n', '<leader>dsi', dap.step_into, { desc = 'DAP: Step Into' })
    vim.keymap.set('n', '<leader>dsO', dap.step_out, { desc = 'DAP: Step Out' })
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'DAP: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>dr', function()
      dapui.close()
      dapui.setup()
      dapui.open()
    end, { desc = 'DAP: Reset UI Layout' })

    dap.adapters.coreclr = {
      type = 'executable',
      command = '/usr/local/netcoredbg',
      args = { '--interpreter=vscode' },
    }

    dap.configurations.cs = {
      {
        type = 'coreclr',
        name = 'Launch',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
        end,
        env = {
          ASPNETCORE_ENVIRONMENT = function()
            return "Development"
          end,
          ASPNETCORE_URLS = function()
            return "http://localhost:5000"
          end,
        },
        cwd = function()
          return vim.fn.getcwd()
        end,
      },
      {
        type = 'coreclr',
        name = 'Attach',
        request = 'attach',
        processId = require('dap.utils').pick_process,
      },
    }
  end
}
