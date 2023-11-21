set history=400
set viminfo+=:400

set background=dark

syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set nu
set title
set ruler
set fileencodings=ucs-bom,utf-8,default,cp1252,cp1251,latin1

filetype plugin indent on

" Split opens on natural side
set splitright
" Mapping for vsf to expand as 'vert sf' only in command context
cnoreabbrev <expr> vsf getcmdtype() == ":" && getcmdline() == 'vsf' ? 'vert sf' : 'vsf'
" Mapping for vsb to expand as 'vert sb' only in command context
cnoreabbrev <expr> vsb getcmdtype() == ":" && getcmdline() == 'vsb' ? 'vert sb' : 'vsb'
" Mapping for vsta to expand as 'vert stag' only in command context
cnoreabbrev <expr> vsta getcmdtype() == ":" && getcmdline() == 'vsta' ? 'vert stag' : 'vsta'

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

" Disable legacy Ex mode and close quickfix instead
nnoremap Q :ccl<cr>

" Leave Insert but move back to last Insert mode cursor position (via mark ^)
inoremap jk <ESC>`^
" AZERTY keyboard mappings
nnoremap ç \
nnoremap è ^
map <space> <leader>

" Allow to type whilst showing matches, show menu even for one item
set completeopt=longest,menuone

" Bash-like tab completion
set wildmode=longest:full,full
set wildmenu

set path+=**

" Ignore object files when completing filenames
set wildignore+=*.o,*.d,*.pyc

" AsyncRun saves all buffers upon running
let g:asyncrun_save=2
" AsyncRun calls :copen before with specified height
let g:asyncrun_open = 12

"Add fzf vim's runtime path
if exists('$HOMEBREW_PREFIX')
    exe 'set rtp+=' . $HOMEBREW_PREFIX . '/opt/fzf'
endif

" Sideways plugin mapping
nnoremap cxh :SidewaysLeft<cr>
nnoremap cxl :SidewaysRight<cr>

" Gutentags plugin
let g:gutentags_cache_dir = "~/.cache/gutentags/"
let g:gutentags_ctags_extra_args = ['--fields=+iaS', '--extra=+q', '--c++-kinds=+p']
 
" Run ripgrep on current word
nnoremap <silent> <leader>g :Rg<cr>

" Move to next ALE error
nnoremap <silent> <leader>j :ALENext()<cr>
nnoremap <silent> <leader>k :ALEPrevious()<cr>

" Automatically open quickfix window for :make :vimgrep...
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
