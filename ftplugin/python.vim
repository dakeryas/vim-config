set complete=.,w,b,u,t
let g:ale_completion_enabled = 1
let g:ale_python_pylint_executable = 'python3'
let b:ale_linters = ['flake8', 'pyls']
let g:ale_python_flake8_options='--ignore=E501,W605'
let g:ale_python_pylint_options='--disable=C0111,C0301'
let g:ale_python_pyls_config = {'pyls': {'plugins': {pydocstyle': {'enabled': v:true}}, 'configurationSources': ['flake8']}}
set omnifunc=ale#completion#OmniFunc

if !exists("current_compiler")
  compiler python3
endif

noremap <silent> <F5> :update \| AsyncRun python3 % <CR>
