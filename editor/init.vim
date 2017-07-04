" ----- PLUGINS -----

call plug#begin('~/.config/nvim/plugged')

  " Themes
  Plug 'morhetz/gruvbox'
  Plug 'w0ng/vim-hybrid'

  Plug 'airblade/vim-gitgutter'                                     " Git diffing
  Plug 'bling/vim-airline'                                          " Powerline-ish
    let g:airline_powerline_fonts=1
    let g:airline#extensions#tabline#enabled=1
  Plug 'junegunn/vim-easy-align'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy file search
    let $FZF_DEFAULT_COMMAND = 'ag -g ""'
  Plug 'junegunn/fzf.vim'                                           " Fzf for Vim
  Plug 'ludovicchabant/vim-gutentags'                               " Manage tag files (ctags)
    let g:gutentags_cache_dir = '~/.tags_cache'
  Plug 'mattn/emmet-vim'
  Plug 'neomake/neomake'                                            " Plugin for running linters (async)
    autocmd! BufWritePost * Neomake
  Plug 'ntpeters/vim-better-whitespace'
    autocmd BufEnter * EnableStripWhitespaceOnSave
  Plug 'rking/ag.vim'                                               " Ag (Silver Searcher)
  Plug 'scrooloose/nerdcommenter'                                   " Comment/uncomment
  Plug 'sheerun/vim-polyglot'                                       " Syntax highlighting (async)
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }     " Autocompletion
    let g:deoplete#enable_at_startup = 1                            " Use deoplete
    inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"
  Plug 'rizzatti/dash.vim'                                          " Dash Docs plugin
  Plug 'slashmili/alchemist.vim'                                    " Elixir integration
    let g:alchemist_tag_disable = 1
  Plug 'tpope/vim-fugitive'                                         " Git

call plug#end()

" ----- SETTINGS -----

filetype plugin indent on

" Leader
let g:mapleader=' '
let mapleader=' '

" Terminal Colors
let g:terminal_color_0  = '#2e3436'
let g:terminal_color_1  = '#cc0000'
let g:terminal_color_2  = '#4e9a06'
let g:terminal_color_3  = '#c4a000'
let g:terminal_color_4  = '#3465a4'
let g:terminal_color_5  = '#75507b'
let g:terminal_color_6  = '#0b939b'
let g:terminal_color_7  = '#d3d7cf'
let g:terminal_color_8  = '#555753'
let g:terminal_color_9  = '#ef2929'
let g:terminal_color_10 = '#8ae234'
let g:terminal_color_11 = '#fce94f'
let g:terminal_color_12 = '#729fcf'
let g:terminal_color_13 = '#ad7fa8'
let g:terminal_color_14 = '#00f5e9'
let g:terminal_color_15 = '#eeeeec'

set autoread
set autoindent                          " Use previous line indent for newly created line
set background=dark
set clipboard=unnamed                   " Copy to system clipboard
" set colorcolumn=80                    " Highlight chars exceeding 80 columns
set completeopt=longest,menuone,preview
set copyindent
set cursorline                          " Highlight cursor position (row/line)
set cursorcolumn                        " Highlight cursor position (col)
set encoding=utf-8
set expandtab                           " Insert space chars for TAB
set fileencoding=utf-8
" set hidden                            " Avoid persisting closed buffers
set hlsearch                            " Highlight search
set incsearch                           " Incremental highlighting while searching
set ignorecase                          " Case-insensitive searches
set lazyredraw                          " Aid in slow redrawing because of 'cursorline'
set linespace=1                         " Line spacing
set mouse=a                             " Allow mouse usage in all modes
set noerrorbells                        " No beeps
" set nohlsearch                        " No highlight when searching
set nojoinspaces                        " Prevents insertion of two spaces after punctuation on line join (J)
set noswapfile                          " Don't make backups before overwriting
set number                              " Always show line numbers
set rtp+=/usr/local/opt/fzf             " For fzf
set ruler                               " Show the line and column numbers
set shiftround
set shiftwidth=2                        " Indentation amount for < and > commands
set shell=zsh                           " Show (partial) command in status line
set showcmd                             " Show (partial) command in status line
set showmatch                           " Show matching brackets
set smartcase                           " Searching with capital letters
set smartindent
set smarttab
set softtabstop=2
set tabstop=2                           " Render TABs using n number of spaces
"set tags=$HOME/.ctags
set termguicolors
set title                               " Set the title of the iTerm tab
set t_Co=256                            " Moar colors

syntax enable

colorscheme gruvbox

" ----- KEY MAPPINGS ---

" Fix (deoplete) <C-c> escape doesn't trigger `InsertLeave` event
" Still need this because `dd` is deleting two lines now
inoremap <C-c> <Esc>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" File name
nmap <Leader>fn :let @*=expand("%") <bar> :echo @*<CR>
" File relative path
nmap <Leader>fy :let @*=expand("%p") <bar> :echo @*<CR>
" File full path
nmap <Leader>ffy :let @*=expand("%:p") <bar> :echo @*<CR>

" Fuzzy finder
nmap <Leader>pf :FZF<CR>
" Ag (Silver Searcher)
nmap <Leader>/ :Ag!<SPACE>

" Search for word under cursor
"noremap <leader>/ :Ag! -Q <C-r>=expand('<cword>')<CR><CR>
" Search for word under visual selection
vnoremap <Leader>/ y:Ag! <C-r>=fnameescape(@")<CR><CR>

"------ Language (Tabs) -----
autocmd FileType make set noexpandtab
autocmd FileType python set noexpandtab
autocmd FileType c setl tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab
