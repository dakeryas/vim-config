set path=**

set complete=.,w,b,u,t
let b:ale_warn_about_trailing_whitespace = 0
let g:ale_virtualtext_cursor = 'disabled'
let g:ale_completion_enabled = 1
let b:ale_linters = ['flake8', 'pylint', 'pylsp']
let b:ale_fixers = ['isort', 'black']
let g:ale_python_flake8_options='--ignore=E501,W605,W503'
let g:ale_python_pyls_config = {'pyls': {'plugins': {'jedi_completion': {'enabled': v:false}}, 'configurationSources': ['flake8']}}
set omnifunc=ale#completion#OmniFunc

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

noremap <silent> <F5> :update \| :call <SID>RunMain() <CR>
