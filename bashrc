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
ATTR_GIT="\[\033[0;32m\]"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# red color for root
[ "$UID" = "0" ] && ATTR_USERNAME="\[\033[0;31m\]"

case $TERM in
    linux|*screen*|*xterm*|ansi|linux-lat|*Eterm*)
        export PS1="${ATTR_USERNAME}\u${ATTR_OFF}@${ATTR_BOLD}\h${ATTR_OFF}${CHROOT} \w${ATTR_GIT}\$(parse_git_branch)${ATTR_OFF} \\\$${ATTR_OFF} "
        export PS2="${ATTR_BOLD}>${ATTR_AV}";;
    *)
        export PS1="\u@\h${CHROOT}:\w\$ "
        export PS2=">$";;
esac

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-brewer.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
