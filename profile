# .profile -*- sh -*-

umask 022

[ -f "$SSH_CLIENT" ] && . $HOME/.ssh-agent

alias rsync="rsync --progress"
alias scpresume="rsync --partial --rsh=ssh"
alias vi="vim"
alias ls="ls $LS_OPTIONS"
alias lsd="ls $LS_OPTIONS -d */"
alias lsl="ls $LS_OPTIONS -l"
alias lslh="ls $LS_OPTIONS -lh"
alias cd..="cd .."
alias cdc="cd;clear"
alias ddu="find . -maxdepth 1 -type d -exec du -sh {} \;"
alias fdu="find . -maxdepth 1 -type f -exec du -sh {} \;"
alias t="$EDITOR ~/.todo"
alias todo="cat ~/.todo"
alias ssh='ssh-add -l > /dev/null 2>&1 || ssh-add -t 10800 ; ssh'
alias scp='ssh-add -l > /dev/null 2>&1 || ssh-add -t 10800 ; scp'
alias keyon="ssh-add -t 28800"
alias keyoff="ssh-add -D"
alias keylist="ssh-add -l"
alias fsdssh='ssh -L 3390:172.16.1.112:3389 -C fsdata'
alias fsdssh67='ssh -L 3390:172.16.1.110:3389 -C fsdata'
alias rdfsd='rdesktop -u tomb -d Office -k no -g 1360x730 -z localhost:3390'
alias rdfsdock='rdesktop -u tomb -d Office -k no -g 1600x1024 -z localhost:3390'
alias rdhome='rdesktop -u administrator -k no -g 1360x730 -z 192.168.1.108:3389'
alias rdhomeext='rdesktop -u administrator -k no -g 1360x730 -z home.bjornli.com:13389'
alias safesurf='ssh -D 8080 tomtom@kug.no'
#alias screen='byobu'

export LANG="en_US.UTF-8"
export LANGUAGE="en"
export LC_MESSAGES="en_GB.UTF-8"