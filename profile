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
alias grep="grep $GREP_OPTIONS"
alias vless="/usr/share/vim/vim73/macros/less.sh"
alias cd..="cd .."
alias cdc="cd;clear"
alias ddu="find . -maxdepth 1 -type d -exec du -sh {} \;"
alias fdu="find . -maxdepth 1 -type f -exec du -sh {} \;"
alias t="$EDITOR ~/.todo"
alias todo="cat ~/.todo"
alias upgrade='sudo apt-get update && sudo apt-get upgrade'
alias apts='apt-cache search $1'
alias apti='sudo apt-get install $1'
alias ssh='ssh-add -l > /dev/null 2>&1 || ssh-add -t 10800 ; ~/.ssh/ssh-wrapper'
alias scp='ssh-add -l > /dev/null 2>&1 || ssh-add -t 10800 ; scp'
alias keyon="ssh-add -t 28800"
alias keyoff="ssh-add -D"
alias keylist="ssh-add -l"
alias fsdssh='ssh -L 3390:172.16.1.112:3389 -C fsdata'
alias fsdssh67='ssh -L 3390:172.16.1.110:3389 -C fsdata'
alias fsdsshsurf='ssh -N -p 22 -c 3des -D 8080 fsdata'
alias rdfsd='rdesktop -u tomb -d Office -k no -g 1900x1024 -z 192.168.0.68'
alias rdfsdext='rdesktop -u tomb -d Office -k no -g 1360x768 -z localhost:3390'
alias rdfsdextdock='rdesktop -u tomb -d Office -k no -g 1900x1524 -z localhost:3390'
alias rdhome='rdesktop -u administrator -k no -g 1360x730 -z 192.168.1.108:3389'
alias rdhomeext='rdesktop -u administrator -k no -g 1360x730 -z home.bjornli.com:13389'
alias safesurf='ssh -D 8080 tomtom@kug.no'
alias stupid='/home/tomtom/dev/web/sync_stupid.sh'
alias whatismyip="curl http://ifconfig.me"
alias whatismyhost="curl http://ifconfig.me/host"
#alias screen='byobu'

export LANG="en_US.UTF-8"
export LANGUAGE="en"
export LC_MESSAGES="en_GB.UTF-8"
