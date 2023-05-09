set complete=.,w,b,u,t

if !exists("current_compiler")
  compiler python3
endif

noremap <silent> <F5> :update \| AsyncRun python3 % <CR>
