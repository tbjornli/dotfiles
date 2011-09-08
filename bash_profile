# .bash_profile -*- sh -*-

[ -f /local/skel/all.bash_profile ] && . /local/skel/all.bash_profile
[ -f ~/.bashrc ] && . ~/.bashrc

# User specific environment and startup programs
ENV=$HOME/.bashrc
HISTCONTROL=ignoreboth
export ENV HISTCONTROL
