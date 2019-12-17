#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
shopt -s extglob
shopt -s expand_aliases
alias gh='cd ~/Documents/GitHub'
alias okul='cd ~/okul/SP20'
alias texclean='rm *.aux *.fls *.log *.out *.synctex.gz *.fdb_latexmk'
alias ls='ls --color=auto'
alias make='sudo make'
alias pacman='sudo pacman'
alias dmenu='dmenu -i -nb white -nf black -sb gray -sf white -w 500 -x 710 -y 400 -fn IBMPlexMono -p dmenu'
# opam configuration from when i used macos, deprecated for now
# test -r /Users/kerem/.opam/opam-init/init.sh && . /Users/kerem/.opam/opam-init/init.sh > /dev/null 2>/dev/null || true
PS1='[\u@\h \W]\$ '

