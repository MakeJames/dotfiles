" MakeJames vim config

" PLUGINS ---------------------------------------------------------------- {{{

    " Install vim-plug if not found
    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif

    " Run PlugInstall if there are missing plugins
    autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
        \| PlugInstall --sync | source $MYVIMRC
    \| endif

    call plug#begin('~/.vim/plugged')

        Plug 'preservim/nerdtree'
        Plug 'joshdick/onedark.vim'
        Plug 'sheerun/vim-polyglot'
        Plug 'bling/vim-airline'
        Plug 'tpope/vim-fugitive'
        Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
        Plug 'davidhalter/jedi-vim'
        Plug 'ekalinin/Dockerfile.vim'
        Plug 'vim-pandoc/vim-pandoc'
        Plug 'yegappan/taglist'

    call plug#end()

    let g:jedi#force_py_version = "3.9"

" }}}

" LOOK AND FEEL ------------------------------------------- {{{

    " Disable compatibility with vi which can cause unexpected issues.
    set nocompatible

    " Show column 80
    highlight ColorColumn ctermbg=grey
    set colorcolumn=80

    " Enable type file detection. Vim will try to detect the file type.
    filetype on

    " Set shift width to 4 spaces.
    set shiftwidth=4

    " Set tab width to 4 columns.
    set tabstop=4

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

    " set colour scheme.
    syntax on
    colorscheme onedark

    " airline settings
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_detect_spell=1
    let g:airline_statusline_ontop=1
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

    " set visual bell
    set visualbell

    " NERDTree
    let NERDTreeShowHidden=1

    " show whitespace
    set list listchars=tab:»-,trail:•,eol:\
    let c_space_errors = 1

" }}}

" LANGUAGE SETTINGS ------------------------------------------------------ {{{

    set spell spelllang=en_gb

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

    " pandoc
" }}}
