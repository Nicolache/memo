set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set spell spelllang=en_us,ru_ru
set spell!


"map ,u :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>
"map ,h :s#^#<!-- #<CR>:s#$# -->#<CR>

map <F3> :set spell!<CR>
map <F4> :w<CR>:!clear; uwsgi --http :9090 --wsgi-file %<CR>
map <F5> :w<CR>:!clear; pycodestyle %<CR>
map <F8> :w<CR>:!clear; mypy %<CR>
map <F9> :w<CR>:!clear; python3 %<CR>
map <F10> :w<CR>:!clear; python3.6 %<CR>
map <F12> :q!<CR>


au FileType python setlocal formatprg=autopep8\ -

autocmd BufLeave,FocusLost silent! wall

au BufRead,BufNewFile * let b:save_time = localtime()

au CursorHold * call UpdateFile()

let g:autosave_time = 1

" save if needed / update the save_time after the save
function! UpdateFile()
   if((localtime() - b:save_time) >= g:autosave_time)
         update
         let b:save_time = localtime()
   else
" just debugging info
         echo "[+] ". (localtime() - b:save_time) ."seconds have elapsed so far."
   endif
endfunction

au BufWritePre * let b:save_time = localtime()
