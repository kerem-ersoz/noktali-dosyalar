" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'dhruvasagar/vim-table-mode'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/goyo.vim'
Plug 'powerline/powerline'
Plug 'jpalardy/vim-slime.git'

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" Disable overfull/underfull \hbox and all package warnings
let g:vimtex_quickfix_latexlog = {
      \ 'overfull' : 0,
      \ 'underfull' : 0,
      \ 'packages' : {
      \   'default' : 0,
      \ },
      \}
colorscheme photon
set number relativenumber 
set breakindent
set hlsearch
set completeopt=menu
nnoremap <esc><esc> :noh<return> 
nnoremap j gj
nnoremap gj j 
nnoremap gk k 
nnoremap k gk 
set autoindent
set smartindent 
set foldmethod=syntax
set foldclose=all
"Init plugin system"
call plug#end()
