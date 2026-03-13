#!/bin/bash
# vim: ft=sh:ts=2:sts=2:et:
#
# Packer
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
#
# 2022-12: brew install packer
# 2025-03: Download from Hashicorp

## https://developer.hashicorp.com/packer/docs/commands#autocompletion
##
complete -C /opt/homebrew/Cellar/packer/1.9.4/libexec/bin/packer packer

if _cmd_exists packer
then :
  _bashrc_verbose "== Packer"
else :
  return
fi
