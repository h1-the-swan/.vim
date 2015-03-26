" File ~/.vim/ftplugin/tex.vim
" LaTeX (tex) file specific settings.
"
" Change working directory for this file to be the file's directory:
lcd %:p:h
"
" LaTeX (rubber) macro for compiling
nnoremap <buffer> <localleader>c :w<CR>:!rubber --pdf --warn all %<CR>
"
" View PDF macro; '%:r' is current file's root (base) name.
nnoremap <buffer> <localleader>p :!open -a Preview %:r.pdf &<CR><CR>

