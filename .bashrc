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
export PROGS_RUN=$HOME/'.progs.run'
export SSH_KEY_DIR=$HOME/.ssh
# export HTTP_PROXY=http://www-proxy-brmdc.us.oracle.com:80/
# export HTTPS_PROXY=http://www-proxy-brmdc.us.oracle.com:80/
# export NO_PROXY=.alm.oraclecorp.com,.alm.oraclecorp.com,.oraclecorp.com,.us.oracle.com,.in.oracle.com

echo $(which open) > $PROGS_RUN &&
  echo $(which vi) >> $PROGS_RUN &&
  echo $(which open) -R >> $PROGS_RUN &&
  echo $(which open) -t >> $PROGS_RUN &&
  echo $(which open) -a subl >> $PROGS_RUN &&
  echo $(which open) -na '/Applications/intellij --args' >> $PROGS_RUN &&



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

bi () { # search and install homebrew packages using fzf
  brew search /./ | fzf | xargs -r brew install
}

qo () {
  local file=$(realpath $(fzf --border --preview '(highlight -O ansi -l {} 2> /dev/null || bat {} --color=always || tree -C {}) 2> /dev/null | head -200')) &&
  local prog=$(cat $PROGS_RUN | fzf) &&

  $prog $file
}

healthcheck () {
  scp -i "$SSH_KEY_DIR/oci-private-opensshkey" -r /Users/kerersoz/GitHub/api-health-check-script/ocss_conf opc@fsc-methods-practice.snlhrprshared1.gbucdsint02lhr.oraclevcn.com:/scratch/api-health-check-script
  ssh -i "$SSH_KEY_DIR/oci-private-opensshkey" opc@fsc-methods-practice.snlhrprshared1.gbucdsint02lhr.oraclevcn.com "bash /scratch/api-health-check-script/linux-api-monitoring-script_latest.sh ocss_conf 138.3.115.248:8085 s1d-rdo-auto2 OracleFSCloudAdmin AdminPassword1"
  scp -i "$SSH_KEY_DIR/oci-private-opensshkey" -r opc@fsc-methods-practice.snlhrprshared1.gbucdsint02lhr.oraclevcn.com:/scratch/api-health-check-script/htmls .
}

sshshort () {
  if [ $1 == "mnp" ]; then 
    ssh -i "$SSH_KEY_DIR/oci-private-opensshkey" opc@fsc-methods-practice.snlhrprshared1.gbucdsint02lhr.oraclevcn.com
  elif [ $1 == "phx-tunnel" ]; then 
    ssh -i "$SSH_KEY_DIR/id_rsa" -D 5555 -C -N kerersoz@144.25.15.161
  elif [ $1 == "phx-tty" ]; then 
    ssh -i "$SSH_KEY_DIR/id_rsa" kerersoz@144.25.15.161
  elif [ $1 == "phx-kibana" ]; then 
    ssh -v -i "$SSH_KEY_DIR/id_rsa" -L 30601:cndevcorp5-phx.msp-master.cne-installer.cfs.oraclecne:30601 -o ServerAliveInterval=30 -N kerersoz@144.25.15.161
  elif [ $1 == "iad-tunnel" ]; then 
    ssh -i "$SSH_KEY_DIR/id_rsa" -D 5555 -C -N kerersoz@130.35.96.164
  elif [ $1 == "iad-tty" ]; then 
    ssh -i "$SSH_KEY_DIR/id_rsa" kerersoz@129.213.14.214
  elif [ $1 == "iad-kibana" ]; then 
    ssh -v -i "$SSH_KEY_DIR/id_rsa" -L 30601:fsgbu-fsc-iad.msp-master.cne-installer.cfs.oraclecne:30601 -o ServerAliveInterval=30 -N kerersoz@129.213.14.214
  else ``ssh "$@"
  fi
}

zookafka () {
  echo "" > $HOME/log/zookeeper.out
  echo "" > $HOME/log/kafka.out
  zookeeper-server-start /usr/local/etc/kafka/zookeeper.properties > $HOME/log/zookeeper.out & 
  sleep 10;
  kafka-server-start /usr/local/etc/kafka/server.properties > $HOME/log/kafka.out &
}

# aliases
  alias cd='cdls'
  alias ls='ls -lhtFG' 
  alias gh='cd ~/GitHub'
  alias grep='grep --color=auto --exclude-dir=\.git'
  alias ranger='ranger --choosedir=$HOME/.config/ranger/rangerdir; LASTDIR=`cat $HOME/.config/ranger/rangerdir`; builtin cd "$LASTDIR"'
  alias ssh='sshshort'
  alias http-sv='http-server -c -o'

# mac specific
  alias sqlite='sqlite3'
  alias subl='open -a subl $*'
  alias notes="$HOME/Documents/notes"
  alias gbash="/usr/local/bin/bash"
  alias tomcat-start="/Library/Tomcat/bin/startup.sh"
  alias tomcat-stop="/Library/Tomcat/bin/shutdown.sh"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
