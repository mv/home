#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:

## Ref:
##   https://docs.netskope.com/en/netskope-help/data-security/netskope-secure-web-gateway/configuring-cli-based-tools-and-development-frameworks-to-work-with-netskope-ssl-interception/
##

if   _cmd_exists netskop
then _bashrc_verbose "== Netskop"
else return 0
fi

# Python/Requests
#export REQUESTS_CA_BUNDLE="/Library/Application Support/Netskope/STAgent/data/nscacert.pem"
#export REQUESTS_CA_BUNDLE="/etc/ssl/certs/nscacert.pem"

#export CURL_CA_BUNDLE=
#export GIT_SSL_CAPATH=
#export NODE_EXTRA_CA_CERTS=


