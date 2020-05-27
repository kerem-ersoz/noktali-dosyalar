# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=vim
export PAGER=less

# enable extended globbing 
shopt -s extglob
shopt -s expand_aliases

# append to the history file, don't overwrite it
shopt -s histappend 

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# aliases
alias ssh='ssh ersoz001@apollo.cselabs.umn.edu'
alias gh='cd ~/Documents/GitHub'
alias vi='vim'
alias okul='cd ~/Okul/sp20'
# alias texclean='rm *.aux *.fls *.log *.out *.synctex.gz *.fdb_latexmk'
alias ls='ls -h -F --color=auto'
alias make='sudo make'
alias pacman='sudo pacman'
alias dmenu='dmenu -i -nb white -nf black -sb gray -sf white -w 500 -x 710 -y 400 -fn IBMPlexMono -p dmenu'
alias dd='sudo mv -t ~/.local/share/.trash'
alias trash='cd ~/.local/share/.trash'
alias ranger='ranger --choosedir=$HOME/.config/ranger/rangerdir; LASTDIR=`cat $HOME/.config/ranger/rangerdir`; cd "$LASTDIR"'

# options for fzf
export FZF_COMPLETION_TRIGGER="*"
export FZF_COMPLETION_OPTS='+c -x'

PS1='[\u@\h \W]\$ '

# input language selection menu 
# turning this into a script and putting it in usr/local/bin because 
# xbindkeys doesn't like it 
# lang_list=("tr\nus")
# alias lang_sel='setxkbmap $(echo -e "$lang_list" | dmenu)'

# use custom ranger config 
RANGER_LOAD_DEFAULT_RC=FALSE 


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
