#!/usr/bin/env bash

set -e

if pgrep -x 'hypridle' < /dev/null; then
    pkill hypridle
    echo 'hypridle off'
else
    hypridle &
    echo 'hypridle on'
fi

