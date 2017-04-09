#!/bin/bash
[[ $1 == "--version" ]] && echo "0.1" && exit 0

scripts=(aliases secret cheatsheet surveillance encryption mqtt nodejs) #config
for script in ${scripts[@]}
    do
      [[ -f ~/qwwq/$script.sh ]] && . ~/qwwq/$script.sh && [[ $qwwqVerbose == true ]] && echo "$script.sh loaded."
    done
