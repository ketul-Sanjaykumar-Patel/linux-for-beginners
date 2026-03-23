" ─────────────────────────────────────────
" .vimrc — Good vim settings for beginners
" Part of: linux-for-beginners by Ketul Patel
" Usage: cp .vimrc ~/.vimrc
" ─────────────────────────────────────────

" Basic settings
set nocompatible            " Use vim not vi
syntax on                   " Enable syntax highlighting
set number                  " Show line numbers
set relativenumber          " Show relative line numbers
set cursorline              " Highlight current line
set showmatch               " Highlight matching brackets

" Indentation
set tabstop=4               " Tab = 4 spaces
set shiftwidth=4            " Indent = 4 spaces
set expandtab               " Use spaces instead of tabs
set autoindent              " Auto indent new lines
set smartindent             " Smart indenting

" Search
set hlsearch                " Highlight search results
set incsearch               " Search as you type
set ignorecase              " Case insensitive search
set smartcase               " Unless you use capitals

" Visual
set ruler                   " Show cursor position
set showcmd                 " Show command in bottom bar
set wildmenu                " Better command completion
set scrolloff=5             " Keep 5 lines above/below cursor
set wrap                    " Wrap long lines

" Files
set encoding=utf-8          " UTF-8 encoding
set autoread                " Auto reload changed files
set nobackup                " No backup files
set noswapfile              " No swap files

" Colors
colorscheme desert          " Use desert color scheme

" Key mappings
nnoremap <C-s> :w<CR>       " Ctrl+S to save
inoremap <C-s> <Esc>:w<CR>i " Ctrl+S to save in insert mode
nnoremap <C-z> :u<CR>       " Ctrl+Z to undo
