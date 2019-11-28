set complete=.,w,b,u,t
let g:ale_python_pylint_executable = 'python3'
let b:ale_linters = ['flake8', 'pylint', 'pylint3']
let g:ale_python_flake8_options='--ignore=E501,W605'
let g:ale_python_pylint_options='--disable=C0111,C0301'
