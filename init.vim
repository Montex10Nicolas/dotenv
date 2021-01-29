call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'

Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'pantharshit00/vim-prisma'
Plug 'jparise/vim-graphql'

filetype plugin on
call plug#end()

" let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-prettier', 'coc-html', 'coc-graphql', 'coc-cssmodules', 'coc-tssever', 'coc-sql', 
"                               'coc-python', 'coc-prisma', 'coc-java', 'coc-go', 'coc-css', 'coc-cmake', 'coc-clangd']

"let g:gruvbox_contrast_dark = 'hard'
"colorscheme gruvbox

colorscheme dracula

"set termguicolors
set updatetime=100
set relativenumber
set number

set tabstop=4
set shiftwidth=4
set expandtab
set cursorline
set smartindent
set autoindent

autocmd VimEnter * NERDTree
nnoremap <silent> <C-p> :Files<CR>

nmap <C-n> :NERDTreeToggle<CR>

let g:NERDTreeIgnore = ['^node_modules$']

command! -nargs=0 Prettier :CocCommand prettier.formatFile

source ./my-coc.vim
