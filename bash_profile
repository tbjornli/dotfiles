# .bash_profile -*- sh -*-

[ -f /local/skel/all.bash_profile ] && . /local/skel/all.bash_profile
[ -f ~/.bashrc ] && . ~/.bashrc

# User specific environment and startup programs
ENV=$HOME/.bashrc
HISTCONTROL=ignoreboth
export ENV HISTCONTROL

# Start ssh-agent
SSHAGENT=`which ssh-agent`
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
    eval `$SSHAGENT $SSHAGENTARGS`
    trap "kill $SSH_AGENT_PID" 0
fi
