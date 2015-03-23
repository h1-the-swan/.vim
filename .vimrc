execute pathogen#infect()
"syntax on
syntax enable
filetype on
filetype plugin indent on
set foldmethod=indent
set foldlevel=99

set incsearch
set ignorecase
set smartcase

" This is the default CursorLine background term color:
let g:CursorLineDefaultColor=236
execute "highlight CursorLine ctermbg=".g:CursorLineDefaultColor

"""
" SET SOLARIZED COLORSCHEME
" first, set the terminal theme to Basic using an AppleScript:
"autocmd VimEnter * :!osascript ~/.vim/ChangeTerminalThemeToBasic.scpt
" second, set the colorscheme:
" Solarized colorscheme
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized
" third, tell the terminal to restore the default when exiting Vim:
"autocmd VimLeave * :!osascript ~/.vim/ChangeTerminalThemeToDefault.scpt
"
" NOTE: solarized never worked right for me. I used Tomorrow instead
"""


colorscheme Tomorrow-Night


let g:pyflakes_use_quickfix = 0
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
nmap <leader>a <Esc>:Ack!
nnoremap <leader>v <Plug>TaskList
nnoremap <leader>b :BufExplorer<CR>
set completeopt-=preview
set wrap linebreak nolist

" remap jj to Escape while in insert mode
inoremap jj <Esc>

" remap '`' to <c-f> in normal mode. This is mainly to use in CtrlP to switch
" modes
nnoremap ` <c-f>

" In normal mode, type '\]' to help find the cursor
function! Highlight_cursor ()
	highlight CursorLine ctermbg=gray
	" the color is also changed in CtrlPHighlightOff() below
	set cursorline
	set cursorcolumn
	redraw
	sleep 500m
	set nocursorline
	set nocursorcolumn
	execute "highlight CursorLine ctermbg=".g:CursorLineDefaultColor
endfunction
nnoremap <leader>] :silent call Highlight_cursor()<CR>

" LaTeX (rubber) macro for compiling
nnoremap <leader>c :w<CR>:!rubber --pdf --warn all %<CR>
"
" " View PDF macro; '%:r' is current file's root (base) name.
nnoremap <leader>p :!open -a Preview %:r.pdf &<CR><CR>

" Shortcut to save changes to the current file:
nnoremap <leader>s :update<CR>

" Make Vim recognize .md files as markdown files:
" http://superuser.com/questions/701496/no-syntax-highlight-on-md-files
augroup markdown
	autocmd!
	autocmd BufRead,BufNew *.md set filetype=markdown
augroup END

" Use the Pencil plugin for writing prose (using soft line wrappings)
" https://github.com/reedes/vim-pencil
set nocompatible
augroup pencil
	autocmd!
	autocmd FileType tex :PencilSoft
	autocmd FileType text :PencilSoft
	autocmd FileType markdown :PencilSoft
augroup END

" Tweaks for ctrlp.vim
"
" Enable hidden directories and files (dotfiles/dotdirs):
let g:ctrlp_show_hidden = 1
" 
" http://stackoverflow.com/questions/21346068/slow-performance-on-ctrlp-it-doesnt-work-to-ignore-some-folders
" persist the cache to speed things up
" and
" https://github.com/kien/ctrlp.vim/issues/48
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
" use ag (the_silver_searcher) instead of vim's native globpath() apis to
" search for files (this should be faster)
if executable('ag')
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
" https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
" Setup some default ignores
let g:ctrlp_custom_ignore = {
    \ 'file': '\v\.(png|jpg|jpeg|gif)$',
\}
" Easy bindings for its various modes
nnoremap <leader>bb :CtrlPBuffer<cr>
nnoremap <leader>bm :CtrlPMixed<cr>
nnoremap <leader>br :CtrlPMRU<cr>
nnoremap <leader>r :CtrlPMRU<cr>
" Alter the highlighting color for the CtrlP window:
function CtrlPHighlightOn()
	highlight CursorLine ctermbg=236
endfunction
function CtrlPHighlightOff()
	execute "highlight CursorLine ctermbg=".g:CursorLineDefaultColor
endfunction
let g:ctrlp_buffer_func = { 'enter': 'CtrlPHighlightOn', 'exit': 'CtrlPHighlightOff', }
" Map '`' to switch search modes (buffer, mru, file)
let g:ctrlp_prompt_mappings = {'ToggleType(1)':        ['<c-f>', '<c-up>', '`'],}