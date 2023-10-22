-- BASIC SETTINGS
vim.opt.showmode=true
vim.opt.number=true
vim.opt.expandtab=true
vim.opt.tabstop=2
vim.opt.splitright=true
vim.opt.splitbelow=true
vim.opt.smartindent=true
vim.opt.autoindent=true
vim.opt.smarttab=true
vim.opt.shiftwidth=2
vim.opt.softtabstop=2
vim.opt.wrap=false
vim.opt.mouse='a'
vim.opt.hidden=true
vim.opt.clipboard='unnamedplus'
vim.opt.ignorecase=true -- ignore case when searching
vim.opt.smartcase=true -- automatically switch to case sensitive when search query contains an uppcase letter
vim.opt.scrolloff=5
vim.opt.showcmd=true
vim.opt.encoding='UTF-8'
vim.opt.errorbells=false
vim.opt.visualbell=true
vim.opt.backup=false
vim.opt.writebackup=false
vim.opt.updatetime=50
vim.opt.ma=true
vim.opt.hlsearch=false -- turn off search highlighting
vim.opt.maxmempattern=5000 -- for large files e.g. base64 encoded ones
vim.opt.fo:remove('c') -- Dont comment new lines after commented line
vim.opt.fo:remove('r') -- Dont comment new lines after commented line
vim.opt.fo:remove('o') -- Dont comment new lines after commented line
vim.opt.termguicolors=true
vim.opt.signcolumn='yes' -- Always show gutter

-- LEADER KEY
vim.g.mapleader = ' '

vim.g.closetag_filenames = '*.html,*.tsx,*.jsx'

-- PLUGINS
require('packer').startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim'
  use {
    'williamboman/nvim-lsp-installer',
    requires = 'neovim/nvim-lspconfig'
  }
  use "jose-elias-alvarez/null-ls.nvim"
  use "jose-elias-alvarez/nvim-lsp-ts-utils"
  use 'jiangmiao/auto-pairs'
  use 'sainnhe/gruvbox-material'
  use 'christoomey/vim-tmux-navigator'
  use 'vim-airline/vim-airline'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'mattn/emmet-vim'
  use 'alvan/vim-closetag'
  use 'airblade/vim-gitgutter'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  -- use 'L3MON4D3/LuaSnip'
  -- use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }
end)

require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- disable = { "c", "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

vim.g.completeopts = "menu,menuone,oneselect,noinsert"

local cmp = require('cmp')

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--   capabilities = capabilities
-- }

-- local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  if client.resolved_capabilities.document_formatting then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
end

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local opts = {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }

  if server.name == 'sumneko_lua' then
    opts.settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim', 'util' }
        }
      }
    }
  end

  if server.name == "tsserver" then
    opts.init_options = require("nvim-lsp-ts-utils").init_options
    opts.on_attach = function(client, bufnr)
      -- to disable deafult tssever formatter which nobody uses
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false

      local ts_utils = require("nvim-lsp-ts-utils")

      -- defaults
      ts_utils.setup({})
      -- required to fix code action ranges and filter diagnostics
      ts_utils.setup_client(client)

      -- no default maps, so you may want to define some here
      local ts_util_opts = { silent = true }
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", ts_util_opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rf", ":TSLspRenameFile<CR>", ts_util_opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", ts_util_opts)

      on_attach(client, bufnr)
    end
    opts.handlers = {
      ["textDocument/definition"] = function(_, result, params)
        if result == nil or vim.tbl_isempty(result) then
          local _ = vim.lsp.log.info() and vim.lsp.log.info(params.method, 'No location found')
          return nil
        end


        if vim.tbl_islist(result) then
           vim.lsp.util.jump_to_location(result[1])
           if #result > 1 then
              local isReactDTs = false
              for _, value in pairs(result) do
                 if string.match(value.uri, "react/index.d.ts") then
                    isReactDTs = true
              break
                 end
              end
              if not isReactDTs then
                 vim.lsp.util.set_qflist(util.locations_to_items(result))
                 vim.api.nvim_command("copen")
                 vim.api.api.nvim_command("wincmd p")
              end
           end
        else
           vim.lsp.util.jump_to_location(result)
        end
      end
    }
      -- opts.root_dir = function() ... end

  end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)

local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint.with({
          only_local = "node_modules/.bin",
        }),
        null_ls.builtins.code_actions.eslint.with({
          only_local = "node_modules/.bin",
        }),
        null_ls.builtins.formatting.prettier.with({
          prefer_local = "node_modules/.bin"
        })
    },
    on_attach = on_attach
})


-- THEME
vim.opt.background='dark'
vim.cmd [[let g:gruvbox_material_background = 'hard']]
vim.cmd [[let g:gruvbox_material_palette = 'mix']]
vim.cmd [[let g:airline_theme = 'gruvbox_material']]
vim.cmd [[colorscheme gruvbox-material]]

-- KEYMAPS
local keymap = vim.api.nvim_set_keymap
keymap('i', 'jj', '<Esc>', {})

-- navigation
local opts = { noremap = true }
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- window resizing
keymap('n', '<M-j>', '<cmd>resize -2<cr>', opts)
keymap('n', '<M-k>', '<cmd>resize +2<cr>', opts)
keymap('n', '<M-h>', '<cmd>vertical resize -2<cr>', opts)
keymap('n', '<M-l>', '<cmd>vertical resize +2<cr>', opts)

-- telescope
keymap('n', '<leader>g', '<cmd>Telescope git_files<cr>', opts)
keymap('n', '<leader>p', '<cmd>Telescope find_files<cr>', opts)
keymap('n', '<leader>w', '<cmd>Telescope live_grep<cr>', opts)

-- nvim-tree
keymap('n', '<C-n>', '<cmd>NvimTreeToggle<cr>', opts)
keymap('n', '<leader>r', '<cmd>NvimTreeFindFile<cr>', opts)
