#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:
#
# using aws cli
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
#
# 2023-02: refactor: FZF completer

###
### bash-completion
###

if which aws_completer 2>/dev/null 1>/dev/null
then
  complete -C aws_completer aws
  if which _fzf-completer.sh 2>&1 > /dev/null
  then complete -C ~/bin/_fzf-completer.sh aws
  fi
fi

