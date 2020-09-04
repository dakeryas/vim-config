packadd CurtineIncSw.vim

" Don't parse all includes when auto-completing
set complete-=i

let g:ale_linters={
      \ 'c': [ 'clang', 'gcc' ]
      \ }

let g:ale_c_parse_makefile = 1

noremap <F4> :update \| AsyncRun make install <CR>
noremap <F5> :update \| AsyncRun make <CR>
noremap <F8> :update \| AsyncRun make debug install <CR>
nmap <F6> :call CurtineIncSw()<CR>
noremap <F9> :update \| AsyncRun make debug <CR>
