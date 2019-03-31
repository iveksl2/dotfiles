filetype plugin on          " required
syntax on

set nocp
execute pathogen#infect()

" call pathogen#helptags()
" call pathogen#runtime_append_all_bundles()"


let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_python_ipython = 1

syntax enable
:set background=light
"let g:solarized_termcolors=256
"set background=light
"colorscheme solarized

filetype indent plugin on 
"hi normal ctermbg=black ctermfg=white
"
" 
""Automatic reloading of .vimrc
""autocmd| bufwritepost .vimrc source %
"
""Better copy & paste
"set clipboard = unnamed

set number     " Show line numbers
set nowrap  " Don't automatically wrap on load
set fo-=t   " Dont automatically wrap text when typing

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

"" goodr
":map fd :r ~/.vim/goodr/roxygen_skeleton.R <ENTER>
":map td :r ~/.vim/goodr/testthat_skeleton.R <ENTER>
"
set noswapfile
