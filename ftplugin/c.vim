packadd CurtineIncSw.vim

" dont parse all includes when auto-completing
set complete-=i

let g:ale_linters={
      \ 'c': [ 'clang', 'gcc' ]
      \ }

let g:ale_c_parse_makefile = 1

map <F4> :update \| AsyncRun make install <CR>
map <F5> :update \| AsyncRun make <CR>
map <F8> :update \| AsyncRun make debug install <CR>
nmap <F6> :call CurtineIncSw()<CR>
map <F9> :update \| AsyncRun make debug <CR>
