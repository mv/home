#!/bin/bash
#
# MacBook as a Server
#
# Marcus Vinicius Ferreira              ferreira.mv[ at ] gmail.com
#

if [ `which synergys` ]
then
    synergys -c ~/bin/synergy-server.conf -f --restart
#   synergys -c ~/.synergy.conf -f --restart
else
    echo
    echo "Server synergys NOT FOUND"
    echo
    exit 1
fi

