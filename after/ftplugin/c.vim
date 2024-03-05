let g:c_clangformat_use_local_file = 1
let g:ale_linters_explicit = 1
let g:ale_linters={
      \ 'c': [ 'gcc', 'clangd' ]
      \ }
let g:ale_c_parse_makefile = 1
let g:ale_fixers={
      \ 'c': [ 'clang-format']
      \ }
