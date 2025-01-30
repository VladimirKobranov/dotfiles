"===============================
" General Settings
"===============================
set nocompatible              " Use Vim settings rather than Vi settings
set encoding=utf-8            " Use UTF-8 encoding
set number                    " Show line numbers
set ruler                     " Show cursor position
set showcmd                   " Show incomplete commands
set incsearch                 " Show match while typing search
set hlsearch                  " Highlight search results
set ignorecase                " Case insensitive search
set smartcase                 " Case-sensitive if search contains uppercase
set autoindent                " Copy indent from the current line when starting a new line
set smartindent               " Enable smart indenting when starting a new line

"===============================
" Tab and Indentation Settings
"===============================
set expandtab                 " Use spaces instead of tabs
set tabstop=4                 " Number of spaces a <Tab> counts for
set shiftwidth=4              " Number of spaces used for auto-indenting
set softtabstop=4             " Number of spaces that a <Tab> counts for while editing

"===============================
" Programming Features
"===============================
syntax enable                 " Enable syntax highlighting
filetype plugin indent on     " Enable file type detection and specific indenting
set showmatch                 " Show matching brackets

"===============================
" Quality of Life Improvements
"===============================
set backspace=indent,eol,start " Allow backspacing over everything in insert mode
set hidden                    " Allow switching buffers without saving
set wildmenu                  " Enhanced command-line completion
set wildmode=list:longest     " List matches and complete up to the longest common string
set laststatus=2              " Always display the status line
set confirm                   " Ask to save changes when exiting

"===============================
" Backup and Swap File Settings
"===============================
set nobackup                  " Don't create backup files
set noswapfile                " Don't create swap files

"===============================
" Plugin Configuration
"===============================
" Using Vim-Plug
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'preservim/nerdtree'     " File Explorer
Plug 'tpope/vim-commentary'   " Quick Commenting
Plug 'morhetz/gruvbox'        " Gruvbox Theme

call plug#end()

"===============================
" Visual and UI Settings
"===============================
set background=dark           " Use dark background
" set cursorline              " Highlight current line
set wrap                      " Wrap long lines
set scrolloff=5               " Keep 5 lines visible above/below the cursor

"===============================
" Theme and Colors
"===============================
" Gruvbox theme settings
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_italic = 1

if exists('+termguicolors')
    set termguicolors         " Enable true colors
endif
colorscheme gruvbox           " Set Gruvbox as the colorscheme

" Make elements transparent
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd vimenter * hi SignColumn guibg=NONE ctermbg=NONE
autocmd vimenter * hi LineNr guibg=NONE ctermbg=NONE

"===============================
" Clipboard Integration
"===============================
set clipboard=unnamedplus     " Use system clipboard by default
vnoremap <leader>y "+y        " Yank to system clipboard
nnoremap <leader>y "+y        " Yank to system clipboard in normal mode
nnoremap <leader>p "+p        " Paste from system clipboard
vnoremap <leader>p "+p        " Paste from system clipboard in visual mode
nnoremap <leader>Y gg"+yG     " Yank entire file to system clipboard

"===============================
" Key Mappings
"===============================
let mapleader = " "           " Set leader key to space

" Quick commands
nnoremap <leader>w :w<CR>     " Save with <leader>w
nnoremap <leader>q :q<CR>     " Quit with <leader>q
nnoremap <leader>c :nohlsearch<CR> " Clear search highlighting with <leader>c

"===============================
" NERDTree Configuration
"===============================
" Autostart NERDTree if Vim opens with a directory argument
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Close Vim if NERDTree is the only window left
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" NERDTree Key Mappings
nnoremap <leader>e :NERDTreeToggle<CR> " Toggle NERDTree with <leader>n
nnoremap <leader>f :NERDTreeFind<CR>   " Find the current file in NERDTree

" NERDTree Options
let NERDTreeShowHidden = 1    " Show hidden files
let g:NERDTreeWinSize = 30    " Set default NERDTree window size
