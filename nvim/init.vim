" -----------------------
" --- BASIC SETTINGS
" -----------------------
set showmode
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
set showcmd
set encoding=utf-8
set visualbell

" TODO: Pick a leader key
" let mapleader = ","


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
Plug 'ap/vim-css-color'					" Colorize css color codes
call plug#end()

" -----------------------
" --- THEME SETTINGS
" -----------------------
syntax enable		" TODO: Maybe change to syntax on

colorscheme gruvbox
set background=dark

set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey
" -----------------------
" --- FZF SETTINGS
" -----------------------

let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

" -----------------------
" --- MAPPINGS
" -----------------------
" Move between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" Use Alt + hjkl to resize windows
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

" Sky Eskace som pesten 
inoremap jj <Esc>	

" NERDTree
nmap <C-n> :NERDTreeToggle<CR>

" FZF
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-g> :GFiles<CR>
nnoremap <silent> <C-o> :Buffers<CR>
nnoremap <silent> <C-f> :Rg!<CR>

