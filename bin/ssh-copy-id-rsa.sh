#!/bin/bash
#
# Ref: http://codesnippets.joyent.com/posts/show/1417
#
# Marcus Vinicius Ferreira               ferreira.mv[ at ]gmail.com
#
# 2009/09

[ -z "$1" ] && {
    cat <<CAT

    Usage: $0 user@host

        copy id_RSA to user@host:~/.ssh/authorized_keys

CAT
exit 1
}

set -x
cat ~/.ssh/id_rsa.pub | ssh $1 "cat - >> ~/.ssh/authorized_keys"

