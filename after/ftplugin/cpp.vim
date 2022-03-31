set cino=g0,+0

let g:asyncrun_open = 12

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
