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
      \ 'cpp': [ 'clangd' ]
      \ }
let g:ale_c_build_dir_names = ['build', 'build_x64']
let g:ale_fixers={
      \ 'cpp': [ 'clang-format']
      \ }
let g:c_clangformat_use_local_file = 1
set omnifunc=ale#completion#OmniFunc
