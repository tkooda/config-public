## attach ssh-agent..

if [ -n "${SSH_AGENT_PID}" ] && [ -S "${SSH_AUTH_SOCK}" ]; then
  if [ -n "`ssh-add -l |grep 'no identities'`" ]; then
    if [ -f ~/.ssh/id_rsa ]; then
      ssh-add ~/.ssh/id_rsa
    elif [ -f ~/.ssh/id_dsa ]; then
      ssh-add ~/.ssh/id_dsa
    fi
  fi
fi
