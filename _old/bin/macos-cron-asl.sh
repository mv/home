#!/bin/bash
#
# cron-ash.sh
#     Keep /var/log/asl/ to a mininum size
#
# 00 02  *  *  * /work/mv-home/bin/macos-cron-asl.sh -f
#
# Ref:
#     http://boredzo.org/blog/archives/2008-01-19/next-week-apple-system-logger
#     http://crucialsecurityblog.harris.com/tag/macintosh/
#     http://developer.apple.com/library/mac/#documentation/Darwin/Reference/ManPages/man5/asl.conf.5.html
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
# 2011-12
#

[ "$1" != "-f" ] && {
    echo
    echo "Usage: $0 -f"
    echo
    echo "    MacOS: To be used in root's cron"
    echo
    exit 1
}

PATH="/usr/local/bin:/usr/bin:/bin"
 LOG="/var/log/${0##*/}.log"

echodo() {
    echo "$@"
    $@
}

# main: logging everything
{
    echo "Begin"
    echodo "launchctl stop  com.apple.syslogd"
    echodo "launchctl stop  com.apple.aslmanager"

    for file in $( find /var/log/asl/ -type f -mtime +1 )
    do
        /bin/ls -lh $file
        /bin/rm $file
    done

    echodo "launchctl start com.apple.syslogd"
    echo "End"

} | gawk '{print strftime("%Y-%m-%d %H:%M:%S :", systime()), $0 }' \
 >> $LOG

# Auto-rotate
size=$( /bin/ls -l $LOG | awk '{print $5}' ) # size in bytes
[ $size -gt 5242880 ] && > $LOG              # truncate when size > 5 mega


# vim:ft=sh:

