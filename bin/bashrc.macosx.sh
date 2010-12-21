#!/bin/bash

###
### mvf
### bashrc lib

# MacOS X {

[ `uname -s` != "Darwin" ] && return

alias sleep_ram='sudo pmset -a hibernatemode 0'
alias sleep_hdd='sudo pmset -a hibernatemode 1'
alias sleep_combined='sudo pmset -a hibernatemode 3'


# Ref: https://github.com/msanders/dotfiles
alias        app='open -a'
alias     chrome='open -a Google\ Chrome --args' # Non-blockingly opens chrome.
alias lastchrome='open -a Google\ Chrome --args --restore-last-session'
alias   keychain='open -a Keychain\ Access'
alias      plist='open -a Property\ List\ Editor'
alias       view='open -a Preview'
alias      xcode='open -a Xcode'

alias    lockmac='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

alias     hiboff='sudo pmset -a hibernatemode 0' # Disables sleep-to-disk on OS X.
alias      hibon='sudo pmset -a hibernatemode 1' # Enables sleep-to-disk on OS X.
alias hibdefault='sudo pmset -a hibernatemode 3' # Back to default setting.

alias   hide='     chflags hidden'   # Hide a file from GUI in OS X.
alias unhide='     chflags nohidden' # Unhide a file from GUI in OS X.
alias   lock='sudo chflags uchg'     # Lock file from modification in OS X.
alias unlock='sudo chflags nouchg'   # Unlock file from modification in OS X.

alias  vncon='sudo touch /etc/ScreenSharing.launchd' # Enables VNC on OS X.
alias vncoff='sudo rm    /etc/ScreenSharing.launchd' # Disables VNC on OS X

# Remove .DS_Store files.
rmdst() {
	if [[ $1 == "" ]]; then
		echo "usage: rmds [directory]";
	else
		find $1 -name ".DS_Store" -type f -print -delete;
	fi
}


# vim: ft=sh:

