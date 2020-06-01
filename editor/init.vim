" ----- PLUGINS -----

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
    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300

    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c

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
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm.
    " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
    if exists('*complete_info')
      inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
      inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif

    " Use `[g` and `]g` to navigate diagnostics
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
      else
        call CocAction('doHover')
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

    " Use CTRL-S for selections ranges.
    " Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')

    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " Add (Neo)Vim's native statusline support.
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline.
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Mappings using CoCList:
    " Show all diagnostics.
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

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

" ----- SETTINGS -----

filetype plugin indent on

" Leader
let g:mapleader=' '
let mapleader=' '

set autoindent              " Use previous line indent for newly created line
set autoread                " Reload file when modified by external application
au FocusGained * :checktime " ^ required for the above to work within vim
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
set rtp+=/usr/local/opt/fzf " For fzf
set ruler                   " Show the line and column numbers
set shell=zsh               " Show (partial) command in status line
set shiftround
set shiftwidth=2            " Indentation amount for < and > commands
set showcmd                 " Show (partial) command in status line
set showmatch               " Show matching brackets
set smartcase               " Searching with capital letters
set cindent
set smarttab
set softtabstop=2
set tabstop=2               " Render TABs using n number of spaces
set tags=tags,./tags,$HOME/tags
if (has("termguicolors"))
  set termguicolors
endif
set title                   " Set the title of the iTerm tab
set t_Co=256                " Moar colors

syntax enable
set background=dark
colorscheme nord

" Line widths
"autocmd FileType elixir set textwidth=120

" Language (Tabs)
autocmd FileType c setl tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab
autocmd BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
autocmd FileType make set noexpandtab
autocmd Filetype python inoremap # X<C-h>#

" Crontab
autocmd filetype crontab setlocal nobackup nowritebackup

" ----- KEY MAPPINGS -----

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
