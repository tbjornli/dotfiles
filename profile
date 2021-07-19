# .profile -*- sh -*-

umask 022

[ -f "$SSH_CLIENT" ] && . $HOME/.ssh-agent

alias open="xdg-open"
alias rsync="rsync --progress"
alias scpresume="rsync --partial --rsh=ssh"
alias vi="vim"
alias dmesg="dmesg -T"
alias ls="ls $LS_OPTIONS"
alias lsd="ls $LS_OPTIONS -d */"
alias lsl="ls $LS_OPTIONS -l"
alias lslh="ls $LS_OPTIONS -lh"
alias grep="grep $GREP_OPTIONS"
alias vless="/usr/share/vim/vim81/macros/less.sh"
alias cd..="cd .."
alias cdc="cd;clear"
alias ddu="find . -maxdepth 1 -type d -exec du -sh {} \;"
alias fdu="find . -maxdepth 1 -type f -exec du -sh {} \;"
alias upgrade='sudo apt-get update && sudo apt-get -V -u upgrade'
alias apts='apt-cache search $1'
alias apti='sudo apt-get install $1'
alias ssh='ssh-add -l > /dev/null 2>&1 || ssh-add -t 10800; \ssh'
alias scp='ssh-add -l > /dev/null 2>&1 || ssh-add -t 10800; \scp'
alias keyon="ssh-add -t 28800"
alias keyoff="keyoff"
alias keylist="ssh-add -l"
alias safesurf='ssh -D 8080 tomtom@kug.no -p 10022'
alias sudo='sudo -E'
alias whatismyip="curl http://ifconfig.me"
alias whatismyip4="curl http://ipv4.icanhazip.com"
alias whatismyip6="curl http://ipv6.icanhazip.com"
alias whatismyhost="curl http://ifconfig.me/host"
alias babyfixmyfrontend="cd ~/contadev/front-end && npm run elm:clean:stuff && npm run update && npm run dev:bundle && npm run dev:bundle:guest"
alias json_pretty="python3 -m json.tool"

export LANG="en_US.UTF-8"
export LANGUAGE="en"
export LC_MESSAGES="en_GB.UTF-8"
