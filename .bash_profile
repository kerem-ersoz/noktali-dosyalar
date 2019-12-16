shopt -s extglob
shopt -s expand_aliases
alias gh='cd ~/Documents/GitHub'
alias okul='cd ~/Google\ Drive/okul/FALL19/'
alias tmux="TERM=screen-256color-bce tmux"

#clean out latexmk output files
alias texclean="rm *.aux *.fls *.log *.out *.synctex.gz *.fdb_latexmk"

# opam configuration
test -r /Users/kerem/.opam/opam-init/init.sh && . /Users/kerem/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
