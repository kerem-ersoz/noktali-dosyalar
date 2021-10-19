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
Plug 'triglav/vim-visual-increment'
Plug 'powerline/powerline'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ycm-core/YouCompleteMe'
" Init plugin system
call plug#end()

" Disable overfull/underfull \hbox and all package warnings
let g:vimtex_quickfix_ignore_filters = [
      \ 'underfull',
      \ 'overfull',
      \ 'Underfull',
      \ 'Overfull',
      \ 'Fancyhdr',
      \ 'fancyhdr',
      \]

let g:tex_flavor = 'latex'

" apply generic ycm conf on startup 
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

colorscheme photon
set number relativenumber 
set hlsearch
set completeopt=menu

" toggle numbers for less annoying copying to clipboard 
map  <c-n> :set invnumber invrelativenumber <cr>

" remove search highlight on repeated presses of esc
nnoremap <esc><esc> :noh<return> 

" enable clicking to move cursor
set mouse=a
" keybinding for turning cursorline on and off
nnoremap ;l :set cursorline!<return>

" scroll using touchpad (intepreted by st as c-e/c-y) also moves cursor
nnoremap <c-e> j
nnoremap <c-y> k
nnoremap k gk
nnoremap j gj

" autocomplete braces in insert mode
" inoremap { {}<ESC>ha
" inoremap [ []<ESC>ha
" inoremap ( ()<ESC>ha
" inoremap " ""<ESC>ha

" change all occurrences of word under cursor 
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" remaps for copying and pasting, these don't work and idk why
nnoremap <space><space><space> :set paste!<return>
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
