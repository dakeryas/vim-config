let g:ale_tex_chktex_options = '-I -n 8'

let g:vimtex_complete_close_braces = 1
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : './build/',
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
