" meta-comment - Nice to link to the original articles the commands come from. Woah woah woah whatsup 

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
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Flag unnecessary whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

syntax enable
set background=dark

set encoding=utf-8
set nu

"color solarized8
