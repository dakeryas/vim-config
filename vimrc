syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set nu
set title

filetype plugin indent on

" Split opens on natural side
 set splitright

set hlsearch

" Bash-like tab completion
set wildmode=longest:full,full
set wildmenu

let g:gutentags_cache_dir = "~/.cache/gutentags/"
let g:gutentags_ctags_extra_args = ['--fields=+iaS', '--extra=+q', '--c++-kinds=+p']
set path+=**

function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Using file extension
autocmd BufWritePre *.h,*.c,*cc,*.cxx,*.hh,*.cpp,*.hpp,*.tex,*.sty,CMakeLists.txt,*.py,*.sh,*.zsh,*.f90,*.yml :call <SID>StripTrailingWhitespaces()

" Automatically open quickfix window for :make :vimgrep...
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Open tag with alt+] in a vertical split window
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

nnoremap <F3> :update<CR>
inoremap <F3> <ESC>:update<CR>l
