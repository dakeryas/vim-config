set cino=g0,+0

nnoremap <F4> :update \| AsyncRun ninja -C ../*build install <CR>
nnoremap <F5> :update \| AsyncRun ninja -C ../*build <CR>
nmap <F6> :call CurtineIncSw()<CR>
