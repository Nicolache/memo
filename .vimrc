set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
map <F2>  :NERDTreeToggle<CR>
map ,u :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>
map ,h :s#^#<!-- #<CR>:s#$# -->#<CR>
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
execute pathogen#infect()
call pathogen#helptags()
