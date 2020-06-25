set linebreak

set complete-=i
set wildignore+=*.aux,*.bbl,*.bcf,*.blg,*.fdb_latexmk,*.fls,*.gz,*.out,*.toc,*.xml

packadd! vimtex
call vimtex#init()

let g:vimtex_complete_close_braces = 1
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

nnoremap <F5> :w\|VimtexCompile<CR>
