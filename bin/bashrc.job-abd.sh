#!/bin/bash

###
### mvf
### bashrc lib


alias sshroot='ssh -p 5022 -l root'
alias  sshabd='ssh -p 5022'
alias  scpabd='scp -P 5022'
alias   sshgw='ssh -t gategw'
alias   sshxp='ssh -t gatexp'

# if which autossh 2>&1 > /dev/null
# then
    # # port used for autossh ping
    # export AUTOSSH_PORT=5023

    # alias     ssh='autossh'
    # alias sshroot='autossh -p 5022 -l root'
    # alias  sshabd='autossh -p 5022'
# fi


# vim: ft=sh:

