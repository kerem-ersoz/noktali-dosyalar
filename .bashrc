#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# enable extended globbing 
shopt -s extglob
shopt -s expand_aliases

# force disable default ranger config (why did i do this?)
RANGER_LOAD_DEFAULT_RC=FALSE 

##
### env variables
##
export EDITOR=vim #/Applications/subl.app/Contents/MacOS/sublime_text
export BROWSER=/Applications/Firefox.app/Contents/MacOS/firefox
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

### fzf <3
export FZF_DEFAULT_COMMAND='rg --files 2>/dev/null'
# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
export FZF_CTRL_T_OPTS="--border --preview '(highlight -O ansi -l {} 2> /dev/null || bat {} --color=always || tree -C {}) 2> /dev/null | head -200'"
export FZF_DEFAULT_OPTS="--keep-right --height=80% --border --color=bg+:236,border:238,spinner:140,hl:140,fg:251,header:241,info:243,pointer:140,marker:120,fg+:251,prompt:243,hl+:120 --tiebreak=end,length -m -1 -0"

##
### random functions
##
cdls () {
  builtin cd $* && ls -lhTF
}

proxied () { # run something through oracles http proxy
  export ALL_PROXY=www-proxy-hqdc.us.oracle.com:80
  $*
  unset ALL_PROXY
}

dbrowse () { # browse directories with fzf
  dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2>/dev/null | \
    fzf +m --keep-right --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200')
  }

fbrowse () { # look for files with ripgrep and fzf
  file=$(rg --files 2>/dev/null | \
    fzf +m --keep-right --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2>/dev/null | head -200')
  }

fd () { # cd with fzf
  dbrowse && cd "$dir" && unset dir
}

reveal () { # same as fd() but reveal in finder
  fbrowse && open -R "$file" && unset file
}

fman () { # search and preview manpages with fzf
    man -k . | grep "(1)\|(4)\|(5)" | fzf -q "$1" --prompt='man> ' --preview $'echo {} | sed -e \'s/([^()]*)//g\' | awk \'{print $1}\' | xargs -r man | col -bx | bat -l man -p --color always' | sed -e 's/([^()]*)//g' | awk '{print $1}' | xargs -r man
}

bi() { # search and install homebrew packages using fzf
  brew search /./ | fzf | xargs -r brew install
}

##
### aliases
##
alias cd='cdls'
alias ls='ls -lhtFG' 
alias gh='cd ~/Documents/GitHub'
alias grep='grep --color=auto --exclude-dir=\.git'
alias subl='open -a subl $*'
alias trash='cd ~/.Trash'
alias ranger='ranger --choosedir=$HOME/.config/ranger/rangerdir; LASTDIR=`cat $HOME/.config/ranger/rangerdir`; builtin cd "$LASTDIR"'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
