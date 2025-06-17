#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:

###
### mvf
### jq colors

_bashrc_verbose "== jq"

# https://jqlang.github.io/jq/manual/#Colors
#
# 1 (bright)          # 30 (black)
# 2 (dim)             # 31 (red)
# 4 (underscore)      # 32 (green)
# 5 (blink)           # 33 (yellow)
# 7 (reverse)         # 34 (blue)
# 8 (hidden)          # 35 (magenta)
#                     # 36 (cyan)
#                     # 37 (white)

# Original
# export "JQ_COLORS=1;30:0;37:0;37:0;37:0;32:1;37:1;37"
# null      1;30    bright black
# false     0;37    white
# true      0;37    white
# numbers   0;37    white
# strings   0;32    green
# arrays    1;37    bright white
# objects   1;37    bright white

if _cmd_exists which jq
then
  # My scheme:
  # null      0;37    underscore white
  # false     1;31    bright red
  # true      1;36    bright cyan
  # numbers   0;37    white
  # strings   0;32    green
  # arrays    1;37    bright white
  # objects   1;33    bright yellow
  export "JQ_COLORS=4;37:1;31:1;36:0;37:0;32:1;37:1;33"
fi
