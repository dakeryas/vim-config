set background=dark

syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set nu
set title

filetype plugin indent on

" Split opens on natural side
 set splitright

 " Highlighting all searches
 set hlsearch

 " Map n, N and * to blink the match using BlinkSearch.vim
 let s:blink_length = 500
 let s:blink_freq = 50
 execute printf("nnoremap <silent> n n:call HLNext(%d, %d)<cr>", s:blink_length, s:blink_freq)
 execute printf("nnoremap <silent> N N:call HLNext(%d, %d)<cr>", s:blink_length, s:blink_freq)
 execute printf("nnoremap <silent> * *:call HLNext(%d, %d)<cr>", s:blink_length, s:blink_freq)

 " Disable legacy Ex mode and open command line history instead
 nnoremap Q q:

" AZERTY keyboard mappings
 inoremap jk <c-c>`^
 inoremap ç \
 noremap è ^

 " Bash-like tab completion
 set wildmode=longest:full,full
 set wildmenu

 " AsyncRun saves all buffers upon running
 let g:asyncrun_save=2

 " Gutentags plugin
 let g:gutentags_cache_dir = "~/.cache/gutentags/"
 let g:gutentags_ctags_extra_args = ['--fields=+iaS', '--extra=+q', '--c++-kinds=+p']

 set path+=**

 " functions
 function! <SID>StripTrailingWhitespaces()
     let l = line(".")
     let c = col(".")
     %s/\s\+$//e
     call cursor(l, c)
 endfun

 " Using file extension
 autocmd BufWritePre *.vim,*.h,*.c,*cc,*.cxx,*.hh,*.cpp,*.hpp,*.tex,*.sty,CMakeLists.txt,*.py,*.sh,*.csh,*.zsh,*.f90,*.yml,*.md,*.cue :call <SID>StripTrailingWhitespaces()

 " Automatically open quickfix window for :make :vimgrep...
 autocmd QuickFixCmdPost [^l]* nested cwindow
 autocmd QuickFixCmdPost    l* nested lwindow

 " Open tag with alt+] in a vertical split window
 map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
