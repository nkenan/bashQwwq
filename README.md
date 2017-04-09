# qwwq
This is a small collection of bash-scripts for bash on macOS and Linux:

Main part of qwwq is scriptsLoader.sh - it is the only file you have to provide to the bash.

# Installation
Append following code to your ~/.bashrc:
```
### **************************************************************************************
## qwwq - https://github.com/nzmTINKER/qwwq

# settings for qwwq
verbose=false && verbose=true

# logic
[[ -f ~/qwwq/scriptsLoader.sh ]] && curl -z ~/qwwq/scriptsLoader.sh http://nzm.mirfac.uberspace.de/scriptsLoader.sh &> /dev/null
[[ -f ~/qwwq/scriptsLoader.sh ]] && . ~/qwwq/scriptsLoader.sh &> /dev/null && [[ $verbose == true ]] && echo "scriptsLoader.sh loaded (version: $(~/qwwq/scriptsLoader.sh --version))"

#tmux attach -t 1 &>/dev/null
### **************************************************************************************
```
If any tmux session is running uncomment the last line.

# Still to do:
nodejs-server, surveillance-server, mqtt-broker,
