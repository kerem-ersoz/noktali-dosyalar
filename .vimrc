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
" Plug 'lervag/vimtex'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Init plugin system
call plug#end()

" Disable overfull/underfull \hbox and all package warnings
" let g:vimtex_quickfix_ignore_filters = [
"       \ 'underfull',
"       \ 'overfull',
"       \ 'Underfull',
"       \ 'Overfull',
"       \ 'Fancyhdr',
"       \ 'fancyhdr',
"       \]

" let g:tex_flavor = 'latex'

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

" change all occurrences of word under cursor 
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" fzf <3
nnoremap ? :BLines<return>
nnoremap <Leader>? :Rg<return>

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

" this is so w doesn't skip over underscores
set iskeyword-=_

" match <> with %
set matchpairs+=<:>

let g:fzf_colors =
\ { 'fg':         ['fg', 'Normal'],
  \ 'bg':         ['bg', 'Normal'],
  \ 'preview-bg': ['bg', 'NormalFloat'],
  \ 'hl':         ['fg', 'Constant'],
  \ 'fg+':        ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':        ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':        ['fg', 'Todo'],
  \ 'info':       ['fg', 'PreProc'],
  \ 'border':     ['fg', 'Ignore'],
  \ 'prompt':     ['fg', 'Conditional'],
  \ 'pointer':    ['fg', 'Constant'],
  \ 'marker':     ['fg', 'Keyword'],
  \ 'spinner':    ['fg', 'Constant'],
  \ 'header':     ['fg', 'Comment'] }
