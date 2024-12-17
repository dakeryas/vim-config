set cino=g0,+0

function! s:GetBuildCmd()
    let l:build_folder = '../' . fnamemodify(getcwd(), ':t') . "_build"
    if !isdirectory(l:build_folder)
        let l:build_folder = "../*build"
    endif
    return "ninja -C " . l:build_folder
endfunction

function! s:GetInstallCmd()
    return s:GetBuildCmd() . " install"
endfunction

nnoremap <F4> :update \| :call asyncrun#run("", {"mode": "async"}, <SID>GetInstallCmd()) <CR>
nnoremap <F5> :update \| :call asyncrun#run("", {"mode": "async"}, <SID>GetBuildCmd()) <CR>
nmap <F6> :call CurtineIncSw()<CR>

let g:ale_linters_explicit = 1
let g:ale_linters={
      \ 'cpp': [ 'g++', 'clangd' ]
      \ }
let g:ale_cpp_clang_executable = 'clang++'
let g:ale_cpp_cc_options = '-std=c++17 -Wall -Wextra -pedantic -I./include -I../include -I$ROOTSYS/include -I$HOME/Software/Geant4/include/Geant4/ -I$HOME/Software/RicochetSim/include -I$HOME/Software/RicochetSimAnaCuts/include'
let g:ale_fixers={
      \ 'cpp': [ 'clang-format']
      \ }
let g:c_clangformat_use_local_file = 1
