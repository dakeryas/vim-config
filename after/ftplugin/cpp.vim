set cino=g0,+0

let g:ale_linters_explicit = 1
let g:ale_linters={
      \ 'cpp': [ 'clang++' ]
      \ }
let g:ale_cpp_clang_executable = 'clang++'
let g:ale_cpp_cc_options = '-std=c++17 -Wall -Wextra -pedantic -I./include -I../include -I$ROOTSYS/include -I$HOME/Software/Geant4/include/Geant4/ -I$HOME/Software/RicochetSim/include'

nnoremap <F4> :update \| AsyncRun ninja -C ../*build install <CR>
nnoremap <F5> :update \| AsyncRun ninja -C ../*build <CR>
nmap <F6> :call CurtineIncSw()<CR>
