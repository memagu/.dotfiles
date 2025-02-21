#!/usr/bin/env bash

set -e

if [[ -z $WSL_DISTRO_NAME ]]; then
   sudo rm -rf /tmp/.X11-unix
   sudo ln -s /mnt/wslg/.X11-unix /tmp/.X11-unix
fi
