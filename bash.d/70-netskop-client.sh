#!/bin/bash
# vim: ft=sh:

## Ref:
##   https://docs.netskope.com/en/netskope-help/data-security/netskope-secure-web-gateway/configuring-cli-based-tools-and-development-frameworks-to-work-with-netskope-ssl-interception/
##

# Python/Requests
export REQUESTS_CA_BUNDLE="/Library/Application Support/Netskope/STAgent/data/nscacert.pem"

#export CURL_CA_BUNDLE=
#export GIT_SSL_CAPATH=
#export NODE_EXTRA_CA_CERTS=


