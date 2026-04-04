#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:

###
### mvf
### ssh utils

if _cmd_exists ssh-agent
then _bashrc_verbose "== SSH/Agent"
else _bashrc_verbose "== SSH/Agent: NOT FOUND"
fi

_agent_state=~/.ssh-agent-state.sh

# Skip if already running
if [[ -f ${_agent_state} ]]
then
  source ${_agent_state}
  _pid=$( ps -ef | grep -w ${SSH_AGENT_PID} | grep -v grep | awk '{print $2}')
  if [[ ${_pid} != "" ]]
  then
    _bashrc_verbose "== SSH/Agent: [${_pid}]"
    return
  fi
fi

# Run it
_agent="$(ssh-agent | grep -v echo)"
echo   "${_agent}" > "${_agent_state}"
source "${_agent_state}"

_bashrc_verbose "== SSH/Agent: [${SSH_AGENT_PID}] - created"
