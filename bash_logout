# ~/.bash_logout: executed by bash(1) when login shell exits.
# when leaving the console clear the screen to increase privacy
case "`tty`" in
    /dev/tty[0-9]) clear
esac

# Stop ssh-agent
if [ ${SSH_AGENT_PID+1} == 1 ]; then
    ssh-add -D
    ssh-agent -k > /dev/null 2>&1
    unset SSH_AGENT_PID
    unset SSH_AUTH_SOCK
fi
