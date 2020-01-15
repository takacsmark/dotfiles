filetype on
syntax on

set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//

set number

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set clipboard=unnamed

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
Plug 'NLKNguyen/papercolor-theme'
Plug 'evanleck/vim-svelte'

call plug#end()

set t_Co=256

set background=light
colorscheme PaperColor

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeNodeDelimiter = "\u00a0"

" Disable header folding in vim-markdown
let g:vim_markdown_folding_disabled = 1

let g:user_emmet_leader_key=','
