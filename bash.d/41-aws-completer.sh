#!/bin/bash
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

if _cmd_exists aws_completer
then
  _bashrc_verbose "== AWS/Completer"
  complete -C aws_completer aws
else :
fi

# if _cmd_exists _fzf-completer.sh
# then
#   _bashrc_verbose "== FZF/Completer"
#   complete -C ~/bin/_fzf-completer.sh aws
# else :
# fi

