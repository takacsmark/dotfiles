filetype on
syntax on

set hidden
set noerrorbells
set belloff=all
set number
set tabstop=4 softtabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set smartcase
set clipboard=unnamed
set noswapfile
set nobackup
set nowritebackup
set undodir=~/vim/.undo/,/tmp//
set undofile
set incsearch
set colorcolumn=80
set cmdheight=2
set shortmess+=c

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', { 'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jremmen/vim-ripgrep'
Plug 'scrooloose/syntastic'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'hisaknown/jupyterkernel.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'NLKNguyen/papercolor-theme'
Plug 'leafgarland/typescript-vim'
Plug 'mbbill/undotree'
Plug 'aklt/plantuml-syntax'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'tyru/open-browser.vim'
Plug 'jparise/vim-graphql'
call plug#end()


"let g:PaperColor_Theme_Options = {
"  \   'theme': {
"  \     'default.dark': { 
"  \       'allow_bold': 1,
"  \       'override' : {
"  \         'color00' : ['#100d23', ''],
"  \         'color01' : ['#ff1865', ''],
"  \         'color03' : ['#76c1ff', ''],
"  \         'color05' : ['#6766B3', ''],
"  \         'color06' : ['#d57bff', ''],
"  \         'color07' : ['#00b0ff', ''],
"  \         'color11' : ['#00ff9c', ''],
"  \         'color14' : ['#fffc58', ''],
"  \         'color17' : ['#fffc58', ''],
"  \         'cursor_fg' : ['#9dff00', ''],
"  \         'cursorlinenr_fg' : ['#00ffc8', ''],
"  \         'linenumber_bg' : ['#050513', ''],
"  \         'linenumber_fg' : ['#3d5afe', ''],
"  \         'popupmenu_bg' : ['#012113', ''],
"  \         'popupmenu_fg' : ['#ffffff', ''],
"  \         'search_bg' : ['#ffffff', ''],
"  \         'search_fg' : ['#ffffff', ''],
"  \         'vertsplit_bg' : ['#ffffff', ''],
"  \         'vertsplit_fg' : ['#ffffff', ''],
"  \         'statusline_active_fg' : ['#ffffff', ''],
"  \         'statusline_inactive_fg' : ['#ffffff', ''],
"  \         'visual_fg' : ['#ffffff', ''],
"  \         'error_fg' : ['#ffffff', ''],
"  \         'cursorline' : ['#ffffff', ''],
"  \         'folded_fg' : ['#ffffff', ''],
"  \         'wildmenu_fg' : ['#ffffff', ''],
"  \         'matchparen_fg' : ['#ffffff', ''],
"  \         'tabline_bg':          ['#372963', '24'],
"  \         'tabline_active_fg':   ['#00ff9c', '238'],
"  \         'tabline_active_bg':   ['#100d23', '254'],
"  \         'tabline_inactive_fg': ['#7877b3', '255'],
"  \         'tabline_inactive_bg': ['#1e1d45', '31'],
"  \       }
"  \     }
"  \   }
"  \ }

set termguicolors 
set background=dark
colorscheme CyberpunkUmbra

let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeNodeDelimiter = "\u00a0"

" Disable header folding in vim-markdown
let g:vim_markdown_folding_disabled = 1

let g:user_emmet_leader_key=','

let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:ycm_python_binary_path = '/usr/bin/python3'

let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_require_pragma = 0

let g:plantuml_previewer#plantuml_jar_path = '/Users/takacsmark/dev/plantuml.jar'

let g:coc_global_extension = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-json',
    \ 'coc-html',
    \ 'coc-docker',
    \ ]

let mapleader = " "
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>v :wincmd v<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

"
" CoC configuration
"
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.0 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" NeoVim-only mapping for visual mode scroll
" Useful on signatureHelp after jump placeholder of snippet expansion
if has('nvim')
  vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
  vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>:w

