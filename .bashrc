#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# enable extended globbing 
shopt -s extglob
shopt -s expand_aliases

########
#aliases
########

cdls () {
  cd $1 && texclean ; ls -lhTF
}

function texclean () { 
  mv *.aux *.fls *.log *.out *.synctex.gz *.fdb_latexmk ~/.Trash/ 2>/dev/null
}

alias cd='cdls'
alias gh='cd ~/Documents/GitHub'
# alias make='sudo make'
# alias pacman='sudo pacman'
# alias dmenu='dmenu -i -nb white -nf black -sb gray -sf white -w 500 -x 710 -y 400 -fn IBMPlexMono -p dmenu'
alias trash='cd ~/.Trash'
alias ranger='ranger --choosedir=$HOME/.config/ranger/rangerdir; LASTDIR=`cat $HOME/.config/ranger/rangerdir`; cd "$LASTDIR"'

# PS1='[\u@\h \W]\$ '

# use custom ranger config 
RANGER_LOAD_DEFAULT_RC=FALSE 

# evaluate opam env (this is a hacky replacement for the hook that opam uses after installing utop 
# eval $(opam env)

