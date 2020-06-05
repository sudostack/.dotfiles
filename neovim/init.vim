source $HOME/.dotfiles/neovim/coc-settings.vim
source $HOME/.dotfiles/neovim/key-mappings.vim
source $HOME/.dotfiles/neovim/language-settings.vim
source $HOME/.dotfiles/neovim/plugins.vim

" ----- SETTINGS -----
autocmd FocusGained * :checktime " required for `set autoread` and `set autoindent`

colorscheme nord

filetype plugin indent on " detection for filetype plugin and indentation

" fzf.vim
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden' " use ripgrep as the default searcher

" netrw settings
let g:netrw_browse_split = 2  " open in new vertical split
let g:netrw_liststyle    = 3  " tree style listing
let g:netrw_winsize      = 25 " netrw window size (percentage)

" vim-airline
let g:airline#extensions#tabline#enabled      = 1
let g:airline#extensions#tabline#formatter    = 'short_path'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#left_sep     = ' '
let g:airline_powerline_fonts                 = 1

" vim-better-whitespace
let g:better_whitespace_enabled             = 0
let g:current_line_whitespace_disabled_hard = 1
let g:strip_whitespace_confirm              = 0
let g:strip_whitespace_on_save              = 1

" vim-polyglot
let g:vim_markdown_new_list_item_indent = 2 " Markdown default indentation

" vim-prettier
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.scss,*.json,*.graphql,*.vue PrettierAsync
let g:prettier#autoformat             = 0
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#print_width     = 120
let g:prettier#exec_cmd_async         = 1

set autoindent              " Use previous line indent for newly created line
set autoread                " Reload file when modified by external application
set background=dark
set cindent
set clipboard=unnamed       " Copy to system clipboard
set completeopt=longest,menuone,preview
set copyindent
set cursorline              " Highlight cursor position (row/line)
set encoding=utf-8
set expandtab               " Insert space chars for TAB
set fileencoding=utf-8
set hidden                  " Avoid persisting closed buffers
set ignorecase              " Case-insensitive searches
set incsearch               " Incremental highlighting while searching
set lazyredraw              " Aid in slow redrawing because of 'cursorline'
set linespace=1             " Line spacing
set mouse=a                 " Allow mouse usage in all modes
set noerrorbells            " No beeps
set nohlsearch              " Highlight search (OFF)
set nojoinspaces            " Prevents insertion of two spaces after punctuation on line join (J)
set noswapfile              " Don't make backups before overwriting
set number                  " Always show line numbers
set relativenumber          " Always show line numbers
set rtp+=/usr/local/bin/fzf " For fzf
set ruler                   " Show the line and column numbers
set shell=zsh               " Show (partial) command in status line
set shiftround
set shiftwidth=2            " Indentation amount for < and > commands
set showcmd                 " Show (partial) command in status line
set showmatch               " Show matching brackets
set smartcase               " Searching with capital letters
set smarttab
set softtabstop=2
set tabstop=2               " Render TABs using n number of spaces
set tags=tags,./tags,$HOME/tags
set termguicolors
set title                   " Set the title of the iTerm tab

syntax enable
