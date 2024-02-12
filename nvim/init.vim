:lua require("plugins")
:lua require("colorscheme")
" :lua require('color_change_watcher')

set completeopt=menu,menuone,noselect

" disable netrw
:lua vim.g.loaded_netrw = 1
:lua vim.g.loaded_netrwPlugin = 1

""""" filetype """""
filetype plugin indent on
syntax on

""""" look """""
set termguicolors
set cursorline
set pumheight=10
set autoread
set incsearch
set hlsearch
autocmd FocusGained,BufEnter * checktime

""""" line numbers """""
set relativenumber
set numberwidth=3
    
""""" tab/spaces """""
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

autocmd FileType lua set sw=2

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
nnoremap <leader>p :Files<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>g :GFiles?<cr>

" toggle between header/source
nnoremap <leader>o :ClangdSwitchSourceHeader<cr>

" toggle nvim-tree
nnoremap <leader>x :NvimTreeToggle<cr>

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
