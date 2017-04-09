#!/bin/bash
[[ $1 == "--version" ]] && echo "0.1" && exit 0

scripts=(aliases dev secret) #config

for script in ${scripts[@]}
    do
      source ~/qwwq/$script.sh &> /dev/null
    done
