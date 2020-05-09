au BufRead,BufNewFile *.icc set filetype=cpp
au BufRead * if search('#include <\w\+>', 'nw') | setlocal ft=cpp | endif
