" meta-comment - Nice to link to the original articles the commands come from. Woah woah woah whatsup 

" https://www.fullstackpython.com/vim.html
" https://realpython.com/vim-and-python-a-match-made-in-heaven/
" https://medium.com/@hanspinckaers/setting-up-vim-as-an-ide-for-python-773722142d1d

" https://github.com/jpalardy/vim-slime
let g:slime_target = "tmux"

set shell=/bin/bash

" https://opensource.com/article/20/2/how-install-vim-plugins
" https://github.com/junegunn/vim-plug
"
" PEP8 Compliance
" https://stackoverflow.com/questions/36741450/vim-setting-error-under-bufread

" Flag unnecessary whitespace

syntax enable    " enable syntax highlighting
set number       " show line numbers
set ts=4         " set tabs to have 4 spaces
set autoindent   " indent when moving to the next line while writing code
set expandtab    " expand tabs into spaces
set shiftwidth=4 " when using the >> or << commands, shift lines by 4 spaces
set showmatch " show the matching part of the pair for [] {} and ()
set incsearch
filetype plugin on
syntax on


" enable all Python syntax highlighting features
let python_highlight_all = 1

" https://swordandsignals.com/2020/12/13/5-lines-in-vimrc.html
set noswapfile " disable swap file

" https://github.com/junegunn/vim-plug
call plug#begin()
Plug 'junegunn/vim-easy-align'
call plug#end() " Initialize plugin system
