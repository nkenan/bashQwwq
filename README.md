# qwwq
This is a small collection of bash-scripts: aliases, nodejs-server, camera-server, mqtt-broker
# installation
Append following code to your ~/.bashrc:

[[ -f ~/qwwq/scriptsLoader.sh ]] && curl -z ~/qwwq/scriptsLoader.sh http://nzm.mirfac.uberspace.de/scriptsLoader.sh &> /dev/null
[[ -f ~/qwwq/scriptsLoader.sh ]] && . ~/qwwq/scriptsLoader.sh &> /dev/null
tmux attach -t 1 &>/dev/null
