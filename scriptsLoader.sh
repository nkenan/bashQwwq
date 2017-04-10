#!/bin/bash
[[ $1 == "--version" ]] && echo "0.1" && exit 0 || exit 1
[[ $1 == "--cheatsheet" ]] && echo "--cheatsheet: no content." && exit 0 || exit 1
[ $1 == "--update" ]] && curl --retry 1 --retry-max 1 -z ~/qwwq/scriptsLoader.sh http://nzm.mirfac.uberspace.de/scriptsLoader.sh &> /dev/null && exit 0 || exit 1


scripts=(aliases secret cheatsheet surveillance encryption mqtt nodejs) #config
for script in ${scripts[@]}
    do
      [[ -f ~/qwwq/$script.sh ]] && . ~/qwwq/$script.sh && [[ $qwwqVerbose == true ]] && echo "$script.sh loaded."
    done
