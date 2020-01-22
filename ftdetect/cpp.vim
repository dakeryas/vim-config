au BufRead,BufNewFile *.icc set filetype=cpp
au BufRead * if search('#include <', 'nw') | setlocal ft=cpp | endif
