" =====================
" MakeJames: Vim Config
" =====================

" https://github.com/MakeJames/dotfiles
" LICENCE: MIT <https://github.com/MakeJames/dotfiles/blob/main/LICENCE>

" Copy wholesale at your own risk.

set nocompatible

syntax on
filetype on
filetype indent on
set modeline
set spell spelllang=en_gb
set encoding=utf-8
set nowrap

set number
set relativenumber

set expandtab
set shiftwidth=4
set tabstop=4

set background=dark
set t_Co=256
set visualbell

highlight ColorColumn ctermbg=darkgrey
set colorcolumn=80

set incsearch
set ignorecase
set smartcase

set showmode

set wildmode=list:longest

set list listchars=tab:»-,trail:•,eol:\
let c_space_errors = 1

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
autocmd FileType mustache setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab


" next buffer
map <S-tab> :bn<Return>

augroup markdown_conceal
    autocmd!
    autocmd InsertEnter *.md set conceallevel=0
    autocmd InsertLeave *.md set conceallevel=2
augroup END
