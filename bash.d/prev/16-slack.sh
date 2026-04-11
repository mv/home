#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:


### MvOps
if  [ -f ~/work/mv-priv/mvops/export-slack-mvops.sh ]
then
  _bashrc_verbose "== Slack"
  source ~/work/mv-priv/mvops/export-slack-mvops.sh
fi


