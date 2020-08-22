#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# enable extended globbing 
# shopt -s extglob
# shopt -s expand_aliases

########
#aliases
########

alias gh='cd ~/Documents/GitHub'
alias okul='cd ~/.okul/SP20'
alias texclean='rm *.aux *.fls *.log *.out *.synctex.gz *.fdb_latexmk'
alias ls='ls --color=auto'
alias make='sudo make'
alias pacman='sudo pacman'
alias dmenu='dmenu -i -nb white -nf black -sb gray -sf white -w 500 -x 710 -y 400 -fn IBMPlexMono -p dmenu'
alias dd='sudo mv -t ~/.local/share/.trash'
alias trash='cd ~/.local/share/.trash'
alias ranger='ranger --choosedir=$HOME/.config/ranger/rangerdir; LASTDIR=`cat $HOME/.config/ranger/rangerdir`; cd "$LASTDIR"'

# PS1='[\u@\h \W]\$ '

# use custom ranger config 
RANGER_LOAD_DEFAULT_RC=FALSE 

# add carla to UE4 installation folder 
export UE4_ROOT=~/UnrealEngine_4.22

# evaluate opam env (this is a hacky replacement for the hook that opam uses after installing utop 
# eval $(opam env)
