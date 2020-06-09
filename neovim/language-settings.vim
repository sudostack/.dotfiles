autocmd BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

autocmd FileType c setl tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab
autocmd FileType make set noexpandtab
autocmd Filetype python inoremap # X<C-h>#
autocmd filetype crontab setlocal nobackup nowritebackup
autocmd filetype markdown,md set spell spelllang=en_us

let g:python3_host_prog = expand('~/.asdf/shims/python3')
let g:ruby_host_prog    = expand('~/.asdf/shims/ruby')
