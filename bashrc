# .bashrc -*- sh -*-

[ -f /etc/bashrc ] && . /etc/bashrc
[ -f /etc/bash.bashrc ] && . /etc/bash.bashrc
[ -f /etc/bash_completion ] && . /etc/bash_completion
[ -f "$HOME/.environment" ] && . $HOME/.environment
[ -f "$HOME/.profile" ] && . $HOME/.profile

shopt -s histappend
shopt -s checkwinsize
shopt -s cdspell

ATTR_BOLD="\[\033[1m\]"
ATTR_USERNAME="\[\033[0;33m\]"
ATTR_OFF="\[\033[0m\]"

# red color for root
[ "$UID" = "0" ] && ATTR_USERNAME="\[\033[0;31m\]"

case $TERM in
    linux|*xterm*|ansi|linux-lat|*Eterm*)
        export PS1="${ATTR_USERNAME}\u${ATTR_OFF}@${ATTR_BOLD}\h${ATTR_OFF}${CHROOT} \w \\\$${ATTR_OFF} "
        export PS2="${ATTR_BOLD}>${ATTR_AV}";;
    *) 
        export PS1="\u@\h${CHROOT}:\w\$ "
        export PS2=">$";;
esac
