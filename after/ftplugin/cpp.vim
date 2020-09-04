set cino=g0,+0

imap <F4> <Esc>:execute FileHeading()<CR><CR>7jo
imap <F5> <Esc>:execute InsertGates()<CR>

noremap <F4> :update \| AsyncRun ninja -C ../*build install <CR>
noremap <F5> :update \| AsyncRun ninja -C ../*build <CR>
nmap <F6> :call CurtineIncSw()<CR>
