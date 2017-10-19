#!/usr/bin/env bash

set -e 

OUT_FILE="$1"

# create empty directories
# we dont have to worry about ownership, and modes cause everything is root

cd ./load-ramdisk/

[[ -d dev ]]  || mkdir dev
[[ -d proc ]] || mkdir proc
[[ -d sys ]]  || mkdir sys

[[ -d recovery-ramdisk ]]  || mkdir recovery-ramdisk

find . | cpio --create --format='newc' | gzip > "$OUT_FILE"