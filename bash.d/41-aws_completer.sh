#!/bin/bash
# vim:ft=sh:
#
# using aws cli
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
#
# 2023-02: refactor: FZF completer

###
### bash-completion
###

if which aws_completer &>/dev/null 
then
  complete -C aws_completer aws
  if   which _fzf-completer.sh &>/dev/null
  then complete -C ~/bin/_fzf-completer.sh aws
  fi
fi

