#!/usr/bin/bash
#
# ferreira.mv
# 2025-02-25

_ssh_agent_script="/tmp/ssh-agent.eval.sh"

start_new_agent() {
  echo "Start new..."
  ssh-agent -s > "${_ssh_agent_script}"
  eval "$(cat ${_ssh_agent_script})"
}

check_agent() {
  _pid=$( awk -F';' '/^SSH_AGENT_PID=/ {print $1}' "${_ssh_agent_script}" | awk -F'=' '{print $2}' )
  echo -n "Check pid ${_pid}"

  _find_pid=$(ps -ef | grep -w "${_pid}" | grep -v grep | awk '{print $2'})
  if [ "${_pid}" == "${_find_pid}" ]
  then echo "... Found!"     ; return 0
  else echo "... NOT found." ; return 1
  fi

}

reuse_agent() {
  if check_agent
  then eval "$(cat ${_ssh_agent_script})"
  else start_new_agent
  fi

}

### Is there a previous session running?
echo
echo "SSH-Agent"

if [ -f "${_ssh_agent_script}" ]
then reuse_agent
else start_new_agent
fi

echo
