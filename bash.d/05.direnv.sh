#!/bin/bash
# vim:ft=sh:
#
# direnv
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
#
# 2024-12:

###
#     https://direnv.net/
#     https://direnv.net/docs/hook.html
#

if   which direnv &>/dev/null
then eval "$(direnv hook bash)"
fi
