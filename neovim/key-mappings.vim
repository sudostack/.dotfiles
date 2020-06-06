" == LEADER ==
let g:mapleader=' '
let mapleader=' '

" == easy align ==
"
" start interactive easyalign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" start interactive easyalign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" == file paths ==
"
" copy file name
nmap <Leader>fn :let @*=expand("%") <bar> :echo @*<CR>
" copy file relative path
nmap <Leader>fy :let @*=expand("%p") <bar> :echo @*<CR>
" copy file full path
nmap <Leader>ffy :let @*=expand("%:p") <bar> :echo @*<CR>

" == fzf ==
"
nmap <Leader>pf :FZF<CR>

" == ripgrep ==
"
nmap <Leader>/ :Rg<SPACE>
" search for word under visual selection
vnoremap <Leader>/ y:Rg <C-r>=fnameescape(@")<CR><CR>

" == vim-test ==
"
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
