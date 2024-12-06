#!/bin/bash

## rpm -qi pkg
## rpm -ql pkg
list="
    glibc-all-langpacks  
    procps-ng 
    bash-completion 
    fzf 
    bzip2 
    gzip 
    xz 
    unzip  
    coreutils 
    fortune-mod 
    wget curl rsync
    dos2unix 
    file 
    make jq yq 
    git 
    hub 
    readline 
    rlwrap 
    ack 
    the_silver_searcher 
    htop btop 
    ipcalc fping httping 
    tmux 
    screen  
    vim 
    sqlite 
    sqlite-tools 
    postgresql 
    pg_top 
"
#   mysql mytop \
#   fortune
#   macvim neovim
#   awscli
#   terraform packer vagrant
#   terragrunt

[ "${1}" != "-y" ] && {
    echo
    echo "Usage: $0 -y"
    echo
    echo "Fedora install ${list}"
    echo
    exit 1
}


## list
sudo yum install -y ${list}
echo

## aws/cli/ssm plugin
if ! which session-manager-plugin &>/dev/null
then sudo yum install -y https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm
else echo "aws/cli/ssm plugin: installed"
fi

## terraform
if ! which terraform &>/dev/null
then sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
else echo "Hashicorp repo: installed"
fi
sudo yum install -y terraform packer vagrant

## direnv
## https://kojipkgs.fedoraproject.org//packages/direnv/2.32.3/5.fc41/x86_64/direnv-2.32.3-5.fc41.x86_64.rpm
if ! which direnv &>/dev/null
then sudo rpm -ivh https://kojipkgs.fedoraproject.org//packages/direnv/2.32.3/5.fc41/x86_64/direnv-2.32.3-5.fc41.x86_64.rpm
else echo "direnv: installed"
fi

## pyenv
if [ ! -d ~/.pyenv/bin ]
then curl https://pyenv.run | bash
else echo "pyenv: installed"
fi


echo
