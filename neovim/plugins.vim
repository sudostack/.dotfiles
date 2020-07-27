call plug#begin('~/.config/nvim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'arcticicestudio/nord-vim'
  Plug 'bling/vim-airline'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'godlygeek/tabular'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'mattn/emmet-vim'
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript', 'typescript', 'css', 'scss', 'json', 'graphql'] }
  Plug 'scrooloose/nerdcommenter'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-fugitive'
  Plug 'vim-test/vim-test'
call plug#end()

" ----- easy-align -----
" start interactive easyalign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" start interactive easyalign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ----- fzf.vim -----
let $FZF_DEFAULT_COMMAND = 'rg --files' " use ripgrep as the default searcher

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nmap <Leader>pf :FZF<CR>

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

" ----- ripgrep -----
nmap <Leader>/ :Rg<SPACE>
" search for word under visual selection
vnoremap <Leader>/ y:Rg <C-r>=fnameescape(@")<CR><CR>

" ----- vim-airline -----
let g:airline#extensions#tabline#enabled      = 1
let g:airline#extensions#tabline#formatter    = 'short_path'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#left_sep     = ' '
let g:airline_powerline_fonts                 = 1

" ----- vim-better-whitespace -----
let g:better_whitespace_enabled             = 0
let g:current_line_whitespace_disabled_hard = 1
let g:strip_whitespace_confirm              = 0
let g:strip_whitespace_on_save              = 1

" ----- vim-polyglot -----
let g:vim_markdown_new_list_item_indent = 2 " Markdown default indentation

" ----- vim-prettier -----
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.scss,*.json,*.graphql,*.vue PrettierAsync
let g:prettier#autoformat             = 0
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#print_width     = 120
let g:prettier#exec_cmd_async         = 1

" ----- vim-test -----
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
