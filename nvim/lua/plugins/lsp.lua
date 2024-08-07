return {
  { 'Hoffs/omnisharp-extended-lsp.nvim' },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    lazy = true,
    config = false,
  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      { 'L3MON4D3/LuaSnip' },
    },
    config = function()
      local cmp = require('cmp')

      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
        },
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          -- ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
        }),
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
    },
    config = function()
      local lsp_zero = require('lsp-zero')

      local lsp_attach = function(client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
        vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { buffer = bufnr })
        vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", { buffer = bufnr })
        vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", { buffer = bufnr })
      end

      lsp_zero.extend_lspconfig({
        sign_text = true,
        lsp_attach = lsp_attach,
        capabilities = require('cmp_nvim_lsp').default_capabilities()
      })

      local lspconfig = require('lspconfig')
      local masonPath = vim.fn.stdpath "data" .. "/mason"

      require('mason-lspconfig').setup({
        ensure_installed = {},
        handlers = {
          -- this first function is the "default handler"
          -- it applies to every language server without a "custom handler"
          function(server_name)
            lspconfig[server_name].setup({})
          end,
          omnisharp = function()
            lspconfig.omnisharp.setup({
              handlers = {
                ["textDocument/definition"] = require('omnisharp_extended').handler,
              },
              cmd = { masonPath .. "/bin/omnisharp", '--languageserver', '--hostPID', tostring(vim.fn.getpid()) },
              settings = {
                RoslynExtensionsOptions = {
                  EnableImportCompletion = true,
                },
              },
            })
          end,
          eslint = function()
            lspconfig.eslint.setup({
              on_attach = function(client, bufnr)
                vim.api.nvim_create_autocmd("BufWritePre", {
                  buffer = bufnr,
                  command = "EslintFixAll",
                })
              end,
            })
          end,
        }
      })
    end
  },
}
