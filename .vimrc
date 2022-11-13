" MakeJames vim config


" PLUGINS ---------------------------------------------------------------- {{{

    call plug#begin('~/.vim/plugged')
    
        Plug 'preservim/nerdtree'
        Plug 'joshdick/onedark.vim'
        Plug 'sheerun/vim-polyglot'
        Plug 'bling/vim-airline'
        Plug 'tpope/vim-fugitive'
        Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

    call plug#end()

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

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

    " This will enable code folding.
    " Use the marker method of folding.
    augroup filetype_vim
        autocmd!
        autocmd FileType vim setlocal foldmethod=marker
    augroup END
    
    " Start NERDTree and put the cursor back in the other window.
    autocmd VimEnter * NERDTree | wincmd p
    
    " Exit Vim if NERDTree is the only window remaining in the only tab.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
    
" }}}

