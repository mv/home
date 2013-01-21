#!/bin/bash

###
### mvf
### bashrc lib

### Rails

# Bundler: http://twistedmind.com/bundle-exec-bash-shortcut
bundle_commands=( spec rspec cucumber cap watchr rails rackup )

function run_bundler_cmd () {
    if [ -e ./Gemfile ]; then
        echo "bundle exec $@"
        bundle exec $@
    else
        echo "$@"
        $@
    fi
}

for cmd in $bundle_commands
do
    alias $cmd="run_bundler_cmd $cmd"
done

### RVM

# bash-completion
 [[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

#[[ -s "$HOME/.rvm/scripts/rvm"     ]] && source "$HOME/.rvm/scripts/rvm"       # This loads RVM into a shell session.
 [[ -s "/usr/local/rvm/scripts/rvm" ]] && {

    # Pre-req: /etc/rvmrc
    source "/usr/local/rvm/scripts/rvm"   # This loads RVM into a shell session.
    rvm 1.9.3
}

function __rvm_ps1() {
    [ "$rvm_ruby_string" ] && echo "[$rvm_ruby_string]"
}

# vim: ft=sh:

