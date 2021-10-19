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

 " At least a few lines below or above the cursor
 set scrolloff=2

 " Map n, N and * to blink the match using BlinkSearch.vim
 let s:blink_length = 500
 let s:blink_freq = 50
 execute printf("nnoremap <silent> n n:call HLNext(%d, %d)<cr>", s:blink_length, s:blink_freq)
 execute printf("nnoremap <silent> N N:call HLNext(%d, %d)<cr>", s:blink_length, s:blink_freq)
 execute printf("nnoremap <silent> * *:call HLNext(%d, %d)<cr>", s:blink_length, s:blink_freq)

 " Disable legacy Ex mode and open command line history instead
 nnoremap Q q:

" Leave Insert but move back to last Insert mode cursor position (via mark ^)
 inoremap jk <ESC>`^
" AZERTY keyboard mappings
 nnoremap ç \
 nnoremap è ^

 " Bash-like tab completion
 set wildmode=longest:full,full
 set wildmenu

 set path+=**

 " Ignore object files when completing filenames
 set wildignore+=*.o,*.d

 " AsyncRun saves all buffers upon running
 let g:asyncrun_save=2

 " Gutentags plugin
 let g:gutentags_cache_dir = "~/.cache/gutentags/"
 let g:gutentags_ctags_extra_args = ['--fields=+iaS', '--extra=+q', '--c++-kinds=+p']

 " Automatically open quickfix window for :make :vimgrep...
 autocmd QuickFixCmdPost [^l]* nested cwindow
 autocmd QuickFixCmdPost    l* nested lwindow
