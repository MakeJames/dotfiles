" =====================
" MakeJames: Vim Config
" =====================

" https://github.com/MakeJames/dotfiles
" LICENCE: MIT <https://github.com/MakeJames/dotfiles/blob/main/LICENCE>

" Copy wholesale at your own risk.

set nocompatible

set background=dark
set t_Co=256


" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plug-ins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')

    Plug 'preservim/nerdtree' " file explorer
    Plug 'sonph/onehalf', { 'rtp': 'vim' } " colour theme
    Plug 'sheerun/vim-polyglot' " language support
    Plug 'bling/vim-airline' " status line
    Plug 'bling/vim-bufferline'
    Plug 'mg979/vim-visual-multi'
    Plug 'tpope/vim-fugitive' " the best git plugin
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    Plug 'davidhalter/jedi-vim'
    Plug 'pechorin/any-jump.vim'
    Plug 'bagrat/vim-buffet'
    Plug 'ryanoasis/vim-devicons'

call plug#end()

let g:jedi#force_py_version = "3.11"

syntax on " syntax highlighting
set showmode

filetype on
filetype indent on
filetype plugin on

set modeline
set spell spelllang=en_gb
set encoding=utf-8
set nowrap

colorscheme onehalfdark

highlight ColorColumn ctermbg=grey
set colorcolumn=80

set number
set relativenumber

set list listchars=tab:»-,trail:•,eol:\
let c_space_errors = 1

set expandtab " spaces not tabs

set incsearch
set ignorecase
set smartcase

set wildmode=list:longest

let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_spell=1
let g:airline_detect_spelllang=1
let g:airline_statusline_ontop=1
let g:airline_inactive_collage=1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" set visual bell
set visualbell


set shiftwidth=4
set tabstop=4

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
autocmd FileType mustache setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Change vim-polyglot syntax highlighting
augroup markdown_conceal
    autocmd!
    autocmd InsertEnter *.md set conceallevel=0
    autocmd InsertLeave *.md set conceallevel=2
augroup END

let NERDTreeShowHidden=1
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" navigate panes
map <tab> <C-w>w
tnoremap <tab> <C-w>w

" move a pane to the left
map <tab>L <C-w>L
tnoremap <tab>L <C-w>L

" move a pane to the Right
map <tab>H <C-w>H
tnoremap <tab>H <C-w>H

" move a pane to the Bottom
map <tab>J <C-w>J
tnoremap <tab>J <C-w>J

" move a pane to the Bottom
map <tab>K <C-w>K
tnoremap <tab>K <C-w>K

" next buffer
map <S-tab> :bn<Return>
"tnoremap <S-tab> <C-w>:bn<Return>

map % :source %<CR>

let maplocalleader = "\\"
" Map <leader>
let mapleader = ","
" cycle windows
map <leader>m <C-W>w
" refresh NERDTree
map <leader>r :NERDTreeRefreshRoot<CR>
" toggle NERDTree
map <leader>t :NERDTreeToggle<CR>

let mapleader = "j"
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_stubs_command = "<leader>s"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

let g:VM_leader = "~"
let g:VM_maps = {}
let g:VM_maps["Select Cursor Down"] = '`<Down>'
let g:VM_maps["Select Cursor Up"]   = '`<Up>'

let mapleader = "t"
map <leader>+ :tabnew
map <leader>n :tabnext<cr>
map <leader>c :tabclose<cr>
map <leader>p :tabprevious<cr>
map <leader>l :tabs<cr>
map <leader>bd :Bclose<cr>:tabclose<cr>gT

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

let g:buffet_always_show_tabline=1
let g:buffet_powerline_separators=1

let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 0

" set guifont=DroidSansMono_Nerd_Font:h11
set guifont=DroidSansMono\ Nerd\ Font
let g:airline_powerline_fonts = 1
