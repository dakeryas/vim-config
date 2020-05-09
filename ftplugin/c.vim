map <F1> :update \| AsyncRun make <CR>
map <F2> :update \| AsyncRun make install <CR>

let g:ale_linters={
      \ 'c': [ 'clang', 'gcc' ]
      \ }

let g:ale_c_parse_makefile = 1
