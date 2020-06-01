call plug#begin('~/.config/nvim/plugged')
  " Themes
  Plug 'arcticicestudio/nord-vim'

  " Git diffing
  Plug 'airblade/vim-gitgutter'

  " Powerline-ish
  Plug 'bling/vim-airline'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#formatter = 'short_path'
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline_powerline_fonts = 1

  " editorconfig.org
  Plug 'editorconfig/editorconfig-vim'

  Plug 'godlygeek/tabular'

  " ripgrep
  Plug 'jremmen/vim-ripgrep'
    let g:rg_command = 'rg --vimgrep -S'
    let g:rg_window_location = 'bot'

  Plug 'junegunn/vim-easy-align'

  " Fuzzy file search
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

  " Fzf for Vim
  Plug 'junegunn/fzf.vim'
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

  Plug 'mattn/emmet-vim'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Disable the confirmation
  Plug 'ntpeters/vim-better-whitespace'
    autocmd BufEnter * EnableStripWhitespaceOnSave
    let g:strip_whitespace_confirm=0

  Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript', 'typescript', 'css', 'scss', 'json', 'graphql'] }
    autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.scss,*.json,*.graphql,*.vue PrettierAsync
    let g:prettier#exec_cmd_async = 1
    let g:prettier#autoformat = 0
    let g:prettier#config#print_width = 120
    let g:prettier#config#bracket_spacing = 'true'

  " Commenting/uncommenting
  Plug 'scrooloose/nerdcommenter'

  " Syntax highlighting (async)
  Plug 'sheerun/vim-polyglot'
    let g:vim_markdown_new_list_item_indent = 2 " Markdown default indentation
    let g:python_highlight_all = 1

  " Git
  Plug 'tpope/vim-fugitive'

call plug#end()
