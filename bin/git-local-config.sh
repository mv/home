#!/bin/bash
#
# Git: set local repos config to user "$1"
#

[ -z "$1" ] && {
cat <<CAT

    Usage: $0 username

CAT
exit 1
}

case "$1" in
    mv)
        set -x
        git config user.name "Marcus Vinicius Ferreira"
        git config user.email ferreira.mv@gmail.com
        git config github.user mv
        git config github.token b2578f3f3901d24fabc5d1780d54516e
        ;;

    mvdba)
        set -x
        git config user.name "Marcus Vinicius Ferreira"
        git config user.email marcus_ferreira@yahoo.com
        git config github.user mvdba
        git config github.token e4bc8bea4158b67275c5b9b6f79b105a
        ;;

    abd)
        set -x
        git config user.name "Marcus Vinicius Ferreira"
        git config user.email marcus.ferreira@abril.com.br
        ;;

    gmail)
        set -x
        git config user.name "Marcus Vinicius Ferreira"
        git config user.email ferreira.mv@gmail.com
        ;;

    *)
        printf "\n    Error: git config not found for username [$1]\n\n";
        exit 2;

esac

exit 0

