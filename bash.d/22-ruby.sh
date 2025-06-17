#!/usr/bin/env bash
# vim: ft=sh:ts=2:sts=2:et:

###
### mvf
### bashrc lib

_bashrc_verbose "== Ruby"

### Rails

# # Bundler: http://twistedmind.com/bundle-exec-bash-shortcut
# bundle_commands=( spec rspec cucumber cap watchr rails rackup )
#
# function run_bundler_cmd () {
#     if [ -e ./Gemfile ]; then
#         echo "bundle exec $@"
#         bundle exec $@
#     else
#         echo "$@"
#         $@
#     fi
# }
#
# for cmd in $bundle_commands
# do
#     alias $cmd="run_bundler_cmd $cmd"
# done

### RVM
if _cmd_exists rvm
then
    # bash-completion
    [[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

    [[ -s "$HOME/.rvm/scripts/rvm"     ]] && source "$HOME/.rvm/scripts/rvm"       # This loads RVM into a shell session.
    # [[ -s "/usr/local/rvm/scripts/rvm" ]] && {
    #    # Pre-req: /etc/rvmrc
    #    source "/usr/local/rvm/scripts/rvm"   # This loads RVM into a shell session.
    #    rvm system
    # }

    function __rvm_ps1() {
        [ "$rvm_ruby_string" ] && echo "[$rvm_ruby_string]"
    }
fi

### rbenv
if _cmd_exists rbenv
then
    eval "$(rbenv init -)"
fi
