:lua require("plugins")

set completeopt=menu,menuone,noselect

""""" filetype """""
filetype plugin indent on
syntax on

""""" look """""
set termguicolors
let g:tokyonight_style = "night"
colorscheme tokyonight
set cursorline
set pumheight=10

""""" line numbers """""
set relativenumber
set numberwidth=3
    
""""" tab/spaces """""
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

""""" mappings """"""
let mapleader=" "
let maplocalleader=","

" move line up
noremap <leader>_ ddkP
" move line down
noremap <leader>- ddp

" exit insert
inoremap jj <esc>
inoremap JJ <esc>
inoremap <esc> <nop>

" uppercase current word
inoremap <c-u> <esc>lviwUi
nnoremap <leader><c-u> viwU

" open vimrc in vsplit
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" remove highlights after successful search
nnoremap <leader>, :nohl<CR>

" fzf bindings
nnoremap <c-p> :Files<cr>
nnoremap <c-b> :Buffers<cr>
nnoremap <c-g> :GFiles?<cr>
