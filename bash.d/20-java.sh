#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:

_bashrc_verbose "== Java"


export JAVA_TOOLS_OPTIONS="-Dlog4j2.formatMsgNoLookups=true"

# Log4J vulnerability
# https://logging.apache.org/log4j/2.x/security.html
export LOG4J_FORMAT_MSG_NO_LOOKUPS=true

#
pathadd /opt/homebrew/opt/openjdk/bin

