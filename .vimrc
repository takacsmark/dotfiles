filetype on
syntax on

set number

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set clipboard=unnamed

let g:user_emmet_leader_key=','
let g:NERDTreeNodeDelimiter = "\u00a0"

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'hisaknown/jupyterkernel.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'Valloric/YouCompleteMe'

call plug#end()

color dracula

map <C-n> :NERDTreeToggle<CR>

" Disable header folding in vim-markdown
let g:vim_markdown_folding_disabled = 1
