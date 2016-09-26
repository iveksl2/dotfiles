
syntax on
filetype indent plugin on 
hi normal ctermbg=black ctermfg=white
"Press Shift-Space (may not work on your system).
imap <S-Space> <Esc>
 
"Automatic reloading of .vimrc
"autocmd| bufwritepost .vimrc source %

"Better copy & paste
"set clipboard = unnamed

set number 	" Show line numbers
"set tw = 79 " width of document(used by gd)
set nowrap  " Don't automatically wrap on load
set fo-=t   " Dont automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


" Real programmers don't use TABs but spaces
set modeline 
set tabstop=4 
set softtabstop=4
set shiftwidth =4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" remaps
:imap jj <Esc>

" goodr
:map fd :r ~/.vim/goodr/roxygen_skeleton.R <ENTER>
:map td :r ~/.vim/goodr/testthat_skeleton.R <ENTER>

set noswapfile
