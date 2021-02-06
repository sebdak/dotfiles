" -----------------------
" --- BASIC SETTINGS
" -----------------------
set showmode
set number
set relativenumber		" Relative numbering
set nowrap				" Display long lines on single line
set hidden				" To keep multiple buffers open
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set smartindent
set autoindent
set ruler
set mouse=a
set splitbelow
set splitright
set clipboard=unnamedplus
set ignorecase		" Ignore case when searching
set smartcase		" Automatically switch search to case-sensitive when search query contains an uppercase letter
set scrolloff=5
set showcmd
set encoding=UTF-8
set visualbell
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=50
set shortmess+=c
set nohlsearch 		" Turn off highlighting when searching
set ma				" Make buffer modifiable
set maxmempattern=5000 " for large files e.g. base64 files
set nocompatible

" Leader key
let mapleader = " "

au BufEnter * set fo-=c fo-=r fo-=o   " Dont add comment when inserting new line under line with comment

au! BufWritePost $MYVIMRC source %	" Auto source init.vim on save

" -----------------------
" --- PLUGINS
" -----------------------
call plug#begin(stdpath('data') . '/plugged')
Plug 'jiangmiao/auto-pairs'				" Adds closing tag and enters insert mode within
Plug 'scrooloose/NERDTree' 				" File tree
Plug 'morhetz/gruvbox' 					" Theme
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 	" Fuzzy finder
Plug 'junegunn/fzf.vim'				  	" Default commands for fzf
Plug 'airblade/vim-rooter' 				" Changes the working directory to the project root
Plug 'christoomey/vim-tmux-navigator'			" Move between vim splits and tmux panes
Plug 'vim-airline/vim-airline' 				" Statusline
Plug 'ap/vim-css-color'					" Colorize css color codes
Plug 'sheerun/vim-polyglot'             " Syntax highlightin
Plug 'neoclide/coc.nvim', {'branch': 'release'}		" Autocomplete engine
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'mhinz/vim-signify'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

" COC extensions
let g:coc_global_extensions = [
	\'coc-tsserver',
	\'coc-html',
	\'coc-css',
	\'coc-json',
	\'coc-prettier',
	\]
" Manually install/uninstall coc-deno when working with deno projects because of conflict with node projects.

" -----------------------
" --- THEME SETTINGS
" -----------------------
syntax enable		" TODO: Maybe change to syntax on

colorscheme gruvbox
set termguicolors
let g:gruvbox_contrast_dark = 'hard'
set background=dark

" -----------------------
" --- MAPPINGS
" -----------------------
" Dont use Esc
inoremap jj <Esc>

" Move between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Use Alt + hjkl to resize windows
nnoremap <silent> <M-j>	:resize -2<CR>
nnoremap <silent> <M-k>	:resize +2<CR>
nnoremap <silent> <M-h>	:vertical resize -2<CR>
nnoremap <silent> <M-l>	:vertical resize +2<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Move lines up/down in visual mode
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" NERDTree
nmap <C-n> :NERDTreeToggle<CR>

" FZF
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-g> :GFiles<CR>
nnoremap <silent> <C-x> :Buffers<CR>
nnoremap <silent> <C-w> :Rg<CR>

" -----------------------
" --- FZF SETTINGS
" -----------------------
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

" -----------------------
" --- close-tag SETTINGS
" -----------------------
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.tsx,*.jsx'

" -----------------------
" --- NERDTree SETTINGS
" -----------------------
let NERDTreeShowHidden=1

" -----------------------
" --- COC SETTINGS
" -----------------------

" for scss files
autocmd FileType scss setl iskeyword+=@-@

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Format with Prettier:
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
