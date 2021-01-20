setlocal spell

" Hide in fold verbose email headers
set foldmethod=manual
1,/^$/-1fold
norm }

function! Sign(greetings)
  let s:line=line(".")
  call setline(s:line, a:greetings . ",")
  call append(s:line,"Valérian Sibille")
  unlet s:line
endfunction

imap <F4> <Esc>:execute Sign("Best regards")<CR>
imap <F5> <Esc>:execute Sign("Best wishes")<CR>
imap <F6> <Esc>:execute Sign("Yours sincerely")<CR>
