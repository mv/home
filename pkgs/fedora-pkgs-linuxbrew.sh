#!/bin/bash

## brew search pkg
## brew info   pkg
list="
    fortune fzf
    hub jq yq
    the_silver_searcher rlwrap
    htop btop
    ipcalc fping httping
    pyenv
    postgresql@16 pgcli pg_top
    tmux
    direnv
    awscli
    terragrunt
"
# wget


[ "${1}" != "-y" ] && {
    echo
    echo "Usage: $0 -y"
    echo
    echo "Fedora brew install ${list}"
    echo
    exit 1
}


## list
for pkg in ${list}
do brew install ${pkg}
done
echo

## aws/cli/ssm
if ! which session-manager-plugin &>/dev/null
then sudo yum install -y https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm
else echo "aws/cli/ssm plugin: installed"
fi

echo
