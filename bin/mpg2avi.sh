#!/bin/bash
#
# Depend:
#   brew install mplayer
#

[ -z "$1" ] && {
    echo
    echo "Usage:"
    echo "    $0 <file.mpg>"
    echo
    exit 1
}

for file in $@
do
    time mencoder "${file}"         \
        -oac mp3lame                \
        -lameopts cbr:br=128:vol=0  \
        -srate 48000                \
        -aid 0                      \
        -ovc lavc                   \
        -sws 0                      \
        -lavcopts threads=2:vcodec=mpeg4:vbitrate=1516:keyint=240:vqmin=2:vqmax=15 \
        -ofps 29.97                 \
        -vop scale=640:352          \
        -noodml                     \
        -ffourcc DIVX               \
        -o ${file}.ff.avi
    echo
    ls -lh "${file}"*
done


