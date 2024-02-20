# .profile -*- sh -*-

umask 022

[ -f "$SSH_CLIENT" ] && . $HOME/.ssh-agent

alias apti='sudo apt-get install $1'
alias apts='apt-cache search $1'
alias babyfixmyfrontend="cd ~/contadev/front-end && npm run elm:clean:stuff && npm run update && npm run dev:bundle && npm run dev:bundle:guest"
alias bat="batcat"
alias cd..="cd .."
alias cdc="cd;clear"
alias ddu="find . -maxdepth 1 -type d -exec du -sh {} \;"
alias dmesg="dmesg -T"
alias fdu="find . -maxdepth 1 -type f -exec du -sh {} \;"
alias grep="grep $GREP_OPTIONS"
alias json_pretty="python3 -m json.tool"
alias keylist="ssh-add -l"
alias keyoff="keyoff"
alias keyon="ssh-add -t 28800"
alias ls="ls $LS_OPTIONS"
alias lsd="ls $LS_OPTIONS -d */"
alias lsl="ls $LS_OPTIONS -l"
alias lslh="ls $LS_OPTIONS -lh"
alias open="xdg-open"
alias rsync="rsync --progress"
alias safesurf='ssh -D 8080 tomtom@kug.no -p 10022'
alias scp='ssh-add -l > /dev/null 2>&1 || ssh-add -t 10800; \scp'
alias scpresume="rsync --partial --rsh=ssh"
alias ssh='ssh-add -l > /dev/null 2>&1 || ssh-add -t 10800; \ssh'
alias sudo='sudo -E'
alias vi="vim"
alias vless="/usr/share/vim/vim81/macros/less.sh"
alias upgrade='sudo apt-get update && sudo apt-get -V -u upgrade'
alias whatismyhost="curl http://ifconfig.me/host"
alias whatismyip="curl http://ifconfig.me"
alias whatismyip4="curl http://ipv4.icanhazip.com"
alias whatismyip6="curl http://ipv6.icanhazip.com"

export LANG="en_US.UTF-8"
export LANGUAGE="en"
export LC_MESSAGES="en_GB.UTF-8"
