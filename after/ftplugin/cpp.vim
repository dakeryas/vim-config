set cino=g0,+0

let s:build_folder = fnamemodify(getcwd(), ':t') . "_build"
let s:build_cmd = "ninja -C ../" . s:build_folder
let s:install_cmd = s:build_cmd . " install"

" Define accessor to install_cmd which is not availabe to external calls
function! s:GetBuildCmd()
    return s:build_cmd
endfunction

" Define accessor to install_cmd which is not availabe to external calls
function! s:GetInstallCmd()
    return s:install_cmd
endfunction

nnoremap <F4> :update \| :call asyncrun#run("", {"mode": "async"}, <SID>GetInstallCmd()) <CR>
nnoremap <F5> :update \| :call asyncrun#run("", {"mode": "async"}, <SID>GetBuildCmd()) <CR>
nmap <F6> :call CurtineIncSw()<CR>
