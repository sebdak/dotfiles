" -----------------------
" --- BASIC SETTINGS
" -----------------------
syntax enable
set number
set relativenumber	" Relative numbering 
set nowrap		" Display long lines on single line
set hidden		" To keep multiple buffers open
set noerrorbells
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

set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey

au! BufWritePost $MYVIMRC source %	" Auto source init.vim on save 

" -----------------------
" --- PLUGINS
" -----------------------
call plug#begin(stdpath('data') . '/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/NERDTree'
Plug 'morhetz/gruvbox'
call plug#end()

" -----------------------
" --- THEME SETTINGS
" -----------------------
colorscheme gruvbox
set background=dark

" -----------------------
" --- MAPPINGS
" -----------------------
inoremap jj <Esc>	
nmap <C-n> :NERDTreeToggle<CR>

" Use Alt + hjkl to resize windows
nnoremap <M-j>	:resize -2<CR>
nnoremap <M-k>	:resize +2<CR>
nnoremap <M-h>	:vertical resize -2<CR>
nnoremap <M-l>	:vertical resize +2<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Move lines up/down in visual mode
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv
