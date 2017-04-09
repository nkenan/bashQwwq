#!/bin/bash
[[ $1 == "--version" ]] && echo "0.1" && exit 0

[[ -f ~/qwwq/aliases.sh ]] && . ~/qwwq/aliases.sh &> /dev/null
[[ -f ~/qwwq/secret.sh ]] && . ~/qwwq/secret.sh &> /dev/null

# scripts=(aliases dev secret) #config
# for script in ${scripts[@]}
#     do
#       source ~/qwwq/$script.sh &> /dev/null
#     done
