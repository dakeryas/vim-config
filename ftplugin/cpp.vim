set cino=g0,+0

packadd CurtineIncSw.vim

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

map <F1> :update \| AsyncRun ninja -C ../*build <CR>
map <F2> :update \| AsyncRun ninja -C ../*build install <CR>
nmap <F5> :call CurtineIncSw()<CR>
