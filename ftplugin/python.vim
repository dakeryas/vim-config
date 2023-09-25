set path=**

set complete=.,w,b,u,t

if !exists("current_compiler")
  compiler python3
endif

function! s:RunMain()
  let main_file = system('grep --include "*.py" -rl __main__ '.getcwd())
  if main_file == ""
      let main_file = expand('%')
  endif
  let command = 'python3 '.main_file
  call asyncrun#run('', {}, command)
endfunction

map <silent> <F5> :update \| :call <SID>RunMain() <CR>
