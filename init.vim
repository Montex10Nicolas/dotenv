call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vim-airline/vim-airline'

Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'pantharshit00/vim-prisma'
Plug 'jparise/vim-graphql'

Plug 'KeitaNakamura/neodark.vim'
Plug 'morhetz/gruvbox'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'ulwlu/elly.vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

filetype plugin on
call plug#end()

"let g:gruvbox_contrast_dark = 'hard'
"colorscheme gruvbox   
colorscheme material

set termguicolors
set updatetime=100
set relativenumber
set number

set tabstop=4
set shiftwidth=4
set expandtab
set cursorline
set smartindent
set autoindent
set nohlsearch
set noswapfile

autocmd VimEnter * NERDTree
nnoremap <silent> <C-p> :Telescope find_files<CR>

nmap <C-n> :NERDTreeToggle<CR>

let g:NERDTreeIgnore = ['^node_modules$', '^.git$']
let NERDTreeShowHidden = 1

command! -nargs=0 Prettier :CocCommand prettier.formatFile

source /home/nicolas/.config/nvim/my-coc.vim

