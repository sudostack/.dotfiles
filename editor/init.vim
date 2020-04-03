" ----- PLUGINS -----

call plug#begin('~/.config/nvim/plugged')
  " Themes
  Plug 'mhartington/oceanic-next'

  " Git diffing
  Plug 'airblade/vim-gitgutter'

  " Powerline-ish
  Plug 'bling/vim-airline'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#formatter = 'short_path'
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline_powerline_fonts = 1

  " Asynchronous Lint Engine for:
  " linting, fixing, completion, go to def, find ref, hover, symbol search
  Plug 'dense-analysis/ale'
  let g:ale_fix_on_save = 1
  let g:ale_fixers = {
        \   '*': ['remove_trailing_lines', 'trim_whitespace'],
        \   'javascript': ['eslint'],
        \}

  " editorconfig.org
  Plug 'editorconfig/editorconfig-vim'

  Plug 'godlygeek/tabular'

  " ripgrep
  Plug 'jremmen/vim-ripgrep'
    let g:rg_window_location = 'bot'

  Plug 'junegunn/vim-easy-align'

  " Fuzzy file search
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

  " Fzf for Vim
  Plug 'junegunn/fzf.vim'
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

  " Manage tag files (ctags)
  Plug 'ludovicchabant/vim-gutentags'
    let g:gutentags_cache_dir = '~/.tags_cache'

  Plug 'mattn/emmet-vim'

  " Conquer of Completion (CoC) / language server support
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Plugin for running linters (async)
  Plug 'neomake/neomake'
    autocmd! BufWritePost * Neomake

  " Disable the confirmation
  Plug 'ntpeters/vim-better-whitespace'
    autocmd BufEnter * EnableStripWhitespaceOnSave
    let g:strip_whitespace_confirm=0

  Plug 'prettier/vim-prettier', { 'do': 'npm install' }
  "\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
    autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
    let g:prettier#exec_cmd_async = 1
    let g:prettier#autoformat = 0
    let g:prettier#autoformat = 0
    let g:prettier#config#print_width = 120
    let g:prettier#config#bracket_spacing = 'true'

  Plug 'rizzatti/dash.vim'

  " Commenting/uncommenting
  Plug 'scrooloose/nerdcommenter'

  " Syntax highlighting (async)
  Plug 'sheerun/vim-polyglot'
    let g:vim_markdown_new_list_item_indent = 2 " Markdown default indentation
    let g:python_highlight_all = 1

  " Autocompletion
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup = 1 " Use deoplete
    let g:python3_host_prog = expand('~/.asdf/shims/python3')
    inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"

  " Git
  Plug 'tpope/vim-fugitive'

  Plug 'tpope/vim-surround'

  Plug 'vim-airline/vim-airline-themes'
    let g:airline_theme='oceanicnext'

call plug#end()

" ----- SETTINGS -----

filetype plugin indent on
let g:ruby_host_prog = expand('~/.asdf/shims/ruby')
call deoplete#custom#option('sources', { '_': ['ale'], })

" Leader
let g:mapleader=' '
let mapleader=' '

set autoindent                          " Use previous line indent for newly created line
set autoread                            " Reload file when modified by external application
au FocusGained * :checktime             " ^ required for the above to work within vim
set clipboard=unnamed                   " Copy to system clipboard
set completeopt=longest,menuone,preview
set copyindent
set cursorline                          " Highlight cursor position (row/line)
set encoding=utf-8
set expandtab                           " Insert space chars for TAB
set fileencoding=utf-8
set foldmethod=syntax                   " Code folding
set hidden                              " Avoid persisting closed buffers
set ignorecase                          " Case-insensitive searches
set incsearch                           " Incremental highlighting while searching
set lazyredraw                          " Aid in slow redrawing because of 'cursorline'
set linespace=1                         " Line spacing
set mouse=a                             " Allow mouse usage in all modes
set noerrorbells                        " No beeps
set nohlsearch                          " Highlight search (OFF)
set nojoinspaces                        " Prevents insertion of two spaces after punctuation on line join (J)
set noswapfile                          " Don't make backups before overwriting
set number                              " Always show line numbers
set relativenumber                      " Always show line numbers
set rtp+=/usr/local/opt/fzf             " For fzf
set ruler                               " Show the line and column numbers
set shell=zsh                           " Show (partial) command in status line
set shiftround
set shiftwidth=2                        " Indentation amount for < and > commands
set showcmd                             " Show (partial) command in status line
set showmatch                           " Show matching brackets
set smartcase                           " Searching with capital letters
set smartindent
set smarttab
set softtabstop=2
set tabstop=2                           " Render TABs using n number of spaces
set tags=tags,./tags,$HOME/tags
if (has("termguicolors"))
  set termguicolors
endif
set title                               " Set the title of the iTerm tab
set t_Co=256                            " Moar colors

syntax enable
set background=dark
colorscheme OceanicNext

" Line widths
"autocmd FileType elixir set textwidth=120

" Language (Tabs)
autocmd FileType c setl tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab
autocmd FileType make set noexpandtab
autocmd Filetype python inoremap # X<C-h>#

" Crontab
autocmd filetype crontab setlocal nobackup nowritebackup


" ----- KEY MAPPINGS -----

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
" ripgrep
nmap <Leader>/ :Rg<SPACE>
" Search for word under visual selection
vnoremap <Leader>/ y:Rg <C-r>=fnameescape(@")<CR><CR>

" Open NERDtree
"map <C-n> :NERDTreeToggle<CR>
" Show current buffer in NERDtree
"nmap <C-m> :NERDTreeFind<CR>
