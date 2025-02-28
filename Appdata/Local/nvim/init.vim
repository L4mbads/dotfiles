:hi Normal guibg=NONE ctermbg=NONE
:hi EndOfBuffer guibg=NONE ctermbg=NONE
:hi StatusLine guibg=NONE ctermbg=NONE

set nocompatible            " disable compatibility to old-time vi

syntax on                   " syntax highlighting
syntax enable

set number                  " add line numbers
set relativenumber          " relative line numbers
set ruler

set noshowmode
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

set showmatch               " show matching 
set ignorecase              " case insensitive 
set hlsearch                " highlight search 
set incsearch               " incremental search

set shiftwidth=4            " width for autoindents
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set autoindent              " indent a new line the same amount as the line just typed
set wildmode=longest,list   " get bash-like tab completions
"set cc=80                   " set an 80 column border for good coding style

filetype plugin indent on   " allow auto-indenting depending on file type
filetype plugin on
set mouse=v                 " enable mouse click
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim

set noswapfile              " disable creating swap file
set clipboard+=unnamedplus  " using system clipboard
set hidden
set switchbuf=useopen
set autoread

"set spell                   " enable spell check (may need to download language package)
"set backupdir=~/.cache/vim  " Directory to store backup files.

call plug#begin()

Plug 'SirVer/ultisnips'
Plug 'lervag/vimtex'
"Plug 'olivercederborg/poimandres.nvim'
"Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'sainnhe/everforest', { 'as': 'everforest' }
Plug 'xiyaowong/transparent.nvim'
"Plug 'lewis6991/gitsigns.nvim'
Plug 'vim-airline/vim-airline'
Plug 'jlanzarotta/bufexplorer'
call plug#end()

set termguicolors
set background=dark

let g:everforest_background = 'hard'
let g:everforest_better_performance = 1

colorscheme everforest

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

let g:UltiSnipsEnableSnipMate      = 0
let g:UltiSnipsExpandTrigger       = '<Tab>'    " use Tab to expand snippets
let g:UltiSnipsJumpForwardTrigger  = '<Tab>'    " use Tab to move forward through tabstops
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'  " use Shift-Tab to move backward through tabstops
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']  " using Neovim

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
" Note: Most plugin managers will do this automatically!
" syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
" let g:vimtex_view_method = 'SumatraPDF'

let g:tex_flavor='latex'
" Or with a generic interface:
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
"     \ 'build_dir' : '',
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
      \ 'callback' : 1,
      \ 'continuous' : 1,
      \ 'executable' : 'latexmk',
      \ 'options' : [
      \   '-pdf',
      \   '-interaction=nonstopmode',
      \ ]
      \}
autocmd fileType tex VimtexCompile

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","

" setlocal spell
" set spelllang=en_us
" inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

lua package.path = package.path .. ";C:/msys64/ucrt64/share/nvim/runtime/lua/?.lua"
lua package.path = package.path .. ";C:/msys64/ucrt64/share/nvim/runtime/lua/vim/?.lua"

nnoremap <SPACE> <Nop>
let mapleader = " "

noremap <silent> <leader>w :w<CR>
noremap <silent> <leader>q :q!<CR>

nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

noremap <silent> <leader>ec :e $MYVIMRC<CR>
noremap <silent> <leader>sc :source $MYVIMRC<CR>
nnoremap <silent> <C-w> :set wrap! wrap?<CR>

nnoremap <silent> <leader>bb <C-^>
" go to next buffer
nnoremap <S-l> :bn<CR>
" go to previous buffer
" https://github.com/neovim/neovim/issues/2048
nnoremap <S-h> :bp<CR>
" close buffer
nnoremap <silent> <leader>bd :bd<CR>
" kill buffer
nnoremap <silent> <leader>bk :bd!<CR>
" list buffers
nnoremap <silent> <leader>bl :ls<CR>
" list and select buffer
nnoremap <silent> <leader>bg :ls<CR>:buffer<Space>
" redraw screan and clear search highlighted items
"http://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting#answer-25569434
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>


" =====================================
" vim-airline status
" configure: https://github.com/vim-airline/vim-airline#user-content-extensible-pipeline
" =====================================
" show buffers (if only one tab)
let g:airline#extensions#tabline#enabled = 1
