packadd CurtineIncSw.vim

" Don't parse all includes when auto-completing
set complete-=i

function! InsertGates()
  let save_pos = getpos(".")
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  put =''
  execute "normal! Go"
  execute "normal! o#endif /* " . gatename . " */"
  call setpos(".", save_pos)
endfunction

function! FileHeading()
  let s:line=line(".")
  call setline(s:line,"/**************************************************************************")
  call append(s:line,"* @file ".expand("%:t"))
  call append(s:line+1,"* @author Valérian Sibille <vsibille@mit.edu>")
  call append(s:line+2,"* @date ".strftime("%d %b %Y"))
  call append(s:line+3,"* @brief ")
  call append(s:line+4,"* ************************************************************************/")
  call append(s:line+5,"")
  unlet s:line
endfunction

imap <F4> <Esc>:execute FileHeading()<CR><CR>7jo
imap <F5> <Esc>:execute InsertGates()<CR>
nnoremap <F4> :update \| AsyncRun make install <CR>
nnoremap <F5> :update \| AsyncRun make <CR>
nnoremap <F8> :update \| AsyncRun make debug install <CR>
nmap <F6> :call CurtineIncSw()<CR>
nnoremap <F9> :update \| AsyncRun make debug <CR>
