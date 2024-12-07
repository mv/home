#!/bin/bash

## rpm -qi pkg
## rpm -ql pkg
list="
    glibc-all-langpacks
    procps-ng
    bash-completion
    coreutils
    dos2unix file which
    make git ack
    readline
    rsync
    terraform packer vagrant
"
#   macvim neovim
#   wget

[ "${1}" != "-y" ] && {
    echo
    echo "Usage: $0 -y"
    echo
    echo "Fedora install ${list}"
    echo
    exit 1
}


## terraform
if ! which terraform &>/dev/null
then sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
else echo "Hashicorp repo: installed"
fi


## list
sudo yum install -y ${list}

echo
