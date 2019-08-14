set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
map <F2>  :NERDTreeToggle<CR>
map ,u :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>
map ,h :s#^#<!-- #<CR>:s#$# -->#<CR>


"=====================================================
"" Python-mode settings
"=====================================================
"" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
let g:pymode_rope = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1

" документация
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
" проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" let g:pymode_lint_ignore="E501,W601,C0110"
" провека кода после сохранения
let g:pymode_lint_write = 1
"
" " поддержка virtualenv
" let g:pymode_virtualenv = 1
"
" " установка breakpoints
" let g:pymode_breakpoint = 1
" let g:pymode_breakpoint_key = '<leader>b'
"
" " подстветка синтаксиса
" let g:pymode_syntax = 1
" let g:pymode_syntax_all = 1
" let g:pymode_syntax_indent_errors = g:pymode_syntax_all
" let g:pymode_syntax_space_errors = g:pymode_syntax_all
"
" " отключить autofold по коду
" let g:pymode_folding = 0
"
" " возможность запускать код
" let g:pymode_run = 0
"


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

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'klen/python-mode'
Plugin 'scrooloose/nerdtree'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
