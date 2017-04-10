# qwwq Quick Guide
A small collection of bash-scripts for macOS and Linux:
cheatsheets, audio and video surveillance, encryption, mqtt, nodejs-server
Main part of qwwq is scriptsLoader.sh - it is the only file you have to provide to the bash.

# Installation
Append following code to your ~/.bashrc for scriptsLoader.sh:
```
### **************************************************************************************
## qwwq - https://github.com/nzmTINKER/qwwq

# settings for qwwq
qwwqVerbose=true
#history -c && clear

# logic
[[ -f ~/qwwq/scriptsLoader.sh ]] && ping -c 1 -W 1 8.8.8.8 &> /dev/null && [[ $? == "0" ]] && curl --retry 1 --retry-max 1 -z ~/qwwq/scriptsLoader.sh http://nzm.mirfac.uberspace.de/scriptsLoader.sh &> /dev/null || curl --retry 1 --retry-max 1 -O http://nzm.mirfac.uberspace.de/scriptsLoader.sh &> /dev/null
[[ -f ~/qwwq/scriptsLoader.sh ]] && . ~/qwwq/scriptsLoader.sh
tmux attach -t 1 2> /dev/null
### **************************************************************************************
```
If any tmux session is running uncomment the last line.

# Usage for aliases
Type `alias` for list of aliases. Package management is included for: pacman, apt-get. Only binaries from main repositories are used.

# Cheatsheets (third-party)
`cheatsheets tmux`
`cheatsheets weechat`

# Cheatsheets (qwwq)
`surveillance --cheatsheet`
`encryption --cheatsheet`
`mqtt --cheatsheet`
`nodejs-server --cheatsheet`

# Audio and video surveillance


# Encryption

# MQTT

# nodejs



# Still to do:
cheatsheets, audio and video surveillance, encryption, mqtt, nodejs-server
