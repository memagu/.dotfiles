#!/bin/bash

[[ "$1" == "-v" || "$1" == "-V" ]] && exec pkexec --version

args=()
for a in "$@"; do
    [[ "$a" == "-S" ]] || args+=("$a")
done
exec pkexec "${args[@]}"
