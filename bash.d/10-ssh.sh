#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:

###
### mvf
### ssh utils

_bashrc_verbose "== SSH"

alias sshno='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no '

alias scpresume='rsync --partial --progress --rsh=ssh'

# alias csshx='csshX'

function sshl() {
  if [ "${3}" == "" ]
  then
    echo
    echo "Usage: sshl <hostname>  <local-port>  <remote-port> [user]"
    echo
    echo "## Connect to local port a remote port"
    echo "   ssh -L       8080:hostname:80           user@hostname"
    echo "   ssh -L local-port:hostname:remote-port  user@hostname"
    echo
    return
  fi

  if [ "${4}" == "" ]]
  then cmd="ssh -L ${2}:${1}:${3}          ${1}"
  else cmd="ssh -L ${2}:${1}:${3}  -l ${4} ${1}"
  fi

  echo "$ ${cmd}"
  $cmd
}


function sshr() {
  if [ "${4}" == "" ]
  then
    echo
    echo "Usage: sshr <service-host>  <local-port>  <remote-port> [user@]bastion"
    echo
    echo "## Connect to local port a remote port via a bastion host"
    echo "   ssh -R       5432:service-host:5432         user@bastion"
    echo "   ssh -R local-port:service-host:remote-port  user@bastion"
    echo
    return
  fi

  if [ "${4}" == "" ]]
  then cmd="ssh -R ${2}:${1}:${3}  ${4}"
  else cmd="ssh -R ${2}:${1}:${3}  ${4}"
  fi

  echo "$ ${cmd}"
  $cmd
}

