#!/bin/bash
ROTATION=$(export LC_ALL=en_US.utf8 && kscreen-doctor -o | grep 'Rotation' | cut -c 20- | sed 's/\x1B[@A-Z\\\]^_]\|\x1B\[[0-9:;<=>?]*[-!"#$%&'"'"'()*+,.\/]*[][\\@A-Z^_`a-z{|}~]//g')
if [ "$ROTATION" = 1 ]; then
    kscreen-doctor output.1.rotation.right
    echo 'screen rotated right!'
    exit
fi
    kscreen-doctor output.1.rotation.normal
    echo 'screen rotated normal!'
    exit
