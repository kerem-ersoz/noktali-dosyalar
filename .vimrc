" autoload plug if it is not already available 
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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
" Init plugin system
call plug#end()

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
set hlsearch
set completeopt=menu

" toggle numbers for less annoying copying to clipboard 
map  <c-n> :set invnumber invrelativenumber <cr>

" remove search highlight on repeated presses of esc
nnoremap <esc><esc> :noh<return> 

" remaps for copying and pasting 
nmap <c-p> :set paste! <cr>
" nnoremap <c-v> <a-v>

" indentation-related settings 
set breakindent
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent 
filetype on 
filetype plugin on 
filetype indent on 

set foldmethod=syntax


" limit the width of text to 72 characters for neomutt 
au BufRead /tmp/mutt/-* set tw=72
