# qwwq
This is a small collection of bash-scripts for bash on macOS and Linux:
aliases, nodejs-server, camera-server, mqtt-broker.

Main part of qwwq is scriptsLoader.sh - it is the only file you have to provide to the bash.
# Installation
Append following code to your ~/.bashrc:
```
[[ -f ~/qwwq/scriptsLoader.sh ]] && curl -z ~/qwwq/scriptsLoader.sh http://nzm.mirfac.uberspace.de/scriptsLoader.sh &> /dev/null
[[ -f ~/qwwq/scriptsLoader.sh ]] && . ~/qwwq/scriptsLoader.sh &> /dev/null
```
