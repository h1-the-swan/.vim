" File ~/.vim/ftplugin/markdown.vim
" Markdown (.markdown, .md) file specific settings.
"
" Change working directory for this file to be the file's directory:
lcd %:p:h
"
" View in Chrome macro (chrome has Markdown Preview extension); '%' is current filename.
nnoremap <buffer> <localleader>p :!open -a Google\ Chrome % &<CR><CR>
