#!/bin/bash
# vim:ft=sh:
#
# using aws cli
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
#
# 2023-02: refactor: FZF completer

_bashrc_verbose "== AWS/Completer"

###
### bash-completion
###

if _cmd_exists aws_completer
then
  complete -C aws_completer aws
fi

if _cmd_exists _fzf-completer.sh
then complete -C ~/bin/_fzf-completer.sh aws
fi

