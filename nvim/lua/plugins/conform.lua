return {
  'stevearc/conform.nvim',
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
    {
      '<leader>tf',
      function()
        -- If autoformat is currently disabled globally,
        -- then enable it globally, otherwise disable it globally
        if vim.g.disable_autoformat then
          vim.cmd 'FormatEnable'
          vim.notify 'Enabled autoformat globally'
        else
          vim.cmd 'FormatDisable'
          vim.notify 'Disabled autoformat globally'
        end
      end,
      desc = 'Toggle autoformat globally',
    },
  },
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettierd", "prettier" },
      javascriptreact = { "prettierd", "prettier" },
      typescript = { "prettierd", "prettier" },
      typescriptreact = { "prettierd", "prettier" },
      json = { "prettierd", "prettier" },
      html = { "prettierd", "prettier" },
      css = { "prettierd", "prettier" },
      cs = { "csharpier" },
      sh = { "shellcheck" },
      toml = { "prettierd", "prettier" },
      yaml = { "prettierd", "prettier" },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
    format_on_save = function()
      if vim.g.disable_autoformat then
        return
      end
      return { timeout_ms = 1500 }
    end,
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
    },
  },
  config = function(_, opts)
    require('conform').setup(opts)

    vim.api.nvim_create_user_command('FormatDisable', function(args)
      if args.bang then
        -- :FormatDisable! disables autoformat for this buffer only
        vim.b.disable_autoformat = true
      else
        -- :FormatDisable disables autoformat globally
        vim.g.disable_autoformat = true
      end
    end, {
      desc = 'Disable autoformat-on-save',
      bang = true, -- allows the ! variant
    })

    vim.api.nvim_create_user_command('FormatEnable', function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = 'Re-enable autoformat-on-save',
    })
  end,
}
