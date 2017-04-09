# qwwq
This is a small collection of bash-scripts for bash on macOS and Linux:
cheatsheets, audio and video surveillance, encryption, mqtt, nodejs-server
Main part of qwwq is scriptsLoader.sh - it is the only file you have to provide to the bash.

# Installation
Append following code to your ~/.bashrc:
```
### **************************************************************************************
## qwwq - https://github.com/nzmTINKER/qwwq

# settings for qwwq
qwwqVerbose=true
#history -c && clear

# logic
[[ -f ~/qwwq/scriptsLoader.sh ]] && ping -c 1 -W 1 8.8.8.8 &> /dev/null && [[ $? == "0" ]] && curl --retry 1 --retry-max 1 -z ~/qwwq/scriptsLoader.sh http://nzm.mirfac.uberspace.de/scriptsLoader.sh &> /dev/null || curl --retry 1 --retry-max 1 -O http://nzm.mirfac.uberspace.de/scriptsLoader.sh &> /dev/null
[[ -f ~/qwwq/scriptsLoader.sh ]] && . ~/qwwq/scriptsLoader.sh
tmux attach -t 1 &> /dev/null
### **************************************************************************************
```
If any tmux session is running uncomment the last line.

# Still to do:
cheatsheets, audio and video surveillance, encryption, mqtt, nodejs-server
