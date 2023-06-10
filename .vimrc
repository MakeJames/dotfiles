" MakeJames vim config

set background=dark
set t_Co=256

" Plug-ins ---------------------------------------------------------------- {{{

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

        " file explorer
        Plug 'preservim/nerdtree'

        " colour themes
        Plug 'joshdick/onedark.vim'
        Plug 'sonph/onehalf', { 'rtp': 'vim' }

        " Startify - opening page for vim
        Plug 'mhinz/vim-startify'

        " indent lines
        Plug 'Yggdroot/indentLine'

        Plug 'lervag/vimtex'
        Plug 'sheerun/vim-polyglot'

        " status line improvements
        Plug 'bling/vim-airline'

        " list buffers in the command bar
        Plug 'bling/vim-bufferline'

        " multiple cursors - IDE madness
        Plug 'mg979/vim-visual-multi'

        " A git plug-in
        Plug 'tpope/vim-fugitive'

        " preview markdown files
        Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

        " awesome python plug-in
        Plug 'davidhalter/jedi-vim'

        " interact with python virtual environments
        Plug 'petobens/poet-v'

        " Jump to definitions across supported languages
        Plug 'pechorin/any-jump.vim'

        Plug 'ekalinin/Dockerfile.vim'
        Plug 'vim-pandoc/vim-pandoc'
        Plug 'vim-pandoc/vim-pandoc-syntax'
        Plug 'szw/vim-tags'

        " IDE like tabs
        Plug 'bagrat/vim-buffet'

        " file icons
        Plug 'ryanoasis/vim-devicons'

    call plug#end()

    let g:jedi#force_py_version = "3.9"

" }}}

" Colour Scheme ---zo---------------------------------------- {{{

    " set colour scheme
    syntax on
    colorscheme onehalfdark

" }}}

" LOOK AND FEEL ------------------------------------------- {{{


    " Disable compatibility with vi which can cause unexpected issues.
    set nocompatible

    " Show column 80
    highlight ColorColumn ctermbg=grey
    set colorcolumn=80

    " Enable type file detection. Vim will try to detect the file type.
    filetype on

    " Enable plugins and load plugin for the detected file type.
    filetype plugin on

    " Load an indent file for the detected file type.
    filetype indent on

    " Turn syntax highlighting on.
    syntax on

    " Turn line numbers on.
    set number

    " spaces not tabs.
    set expandtab

    " set dynamic search.
    set incsearch

    " case insensitivity
    set ignorecase
    set smartcase

    " no wrap
    set nowrap

    " show mode
    set showmode

    " set autocompletion
    set wildmode=list:longest

    " airline settings
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_detect_spell=1
    let g:airline_detect_spelllang=1
    let g:airline_statusline_ontop=1
    let g:airline_inactive_collage=1
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

    " set visual bell
    set visualbell

    " NERDTree
    let NERDTreeShowHidden=1

    " show whitespace
    set list listchars=tab:»-,trail:•,eol:\
    let c_space_errors = 1

" }}}

" {{{ INDENTATION SETTINGS

    " Set shift width to 4 spaces.
    set shiftwidth=4

    " Set tab width to 4 columns.
    set tabstop=4

    autocmd FileType html setlocal shiftwidth=2 tabstop=2
    autocmd FileType css setlocal shiftwidth=2 tabstop=2
    autocmd FileType scss setlocal shiftwidth=2 tabstop=2
" }}}


" LANGUAGE SETTINGS ------------------------------------------------------ {{{

    set spell spelllang=en_gb
    set encoding=utf-8

    " needed for vim-polyglot
    set nocompatible

" }}}

" VIM SCRIPT -------------------------------------------------------------- {{{

    " This will enable code folding.
    " Use the marker method of folding.
    augroup filetype_vim
        autocmd!
        autocmd FileType vim setlocal foldmethod=marker
    augroup END

    augroup filetype_sql
        autocmd!
        autocmd FileType sql setlocal foldmethod=marker
    augroup END

    " Start NERDTree and put the cursor back in the other window.
    autocmd VimEnter * NERDTree | wincmd p

    " Exit Vim if NERDTree is the only window remaining in the only tab.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" }}}

" Custom Mappings ---------------------------------------------------------------- {{{


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
" }}}

" {{{Tabs & Buffers

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
" }}}

" {{{vim-tags

    let g:vim_tags_cache_dir = expand($HOME) . "/.cache"

    let g:vim_tags_auto_generate = 1

" vim-tags}}}

" {{{pandoc

    let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
    let g:pandoc#filetypes#pandoc_markdown = 0

" pandoc}}}

" {{{poet-v

    let g:poetv_executables = ['poetry', ]

    let g:poetv_auto_activate = 1



" poet-v}}}

" {{{devicons

    " set guifont=DroidSansMono_Nerd_Font:h11
    set guifont=DroidSansMono\ Nerd\ Font
    let g:airline_powerline_fonts = 1

" devicons}}}
