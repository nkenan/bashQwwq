#!/bin/bash
shopt -s expand_aliases

package_pacman=false;
[[ $(pacman -Q pacman &>/dev/null) ]] && [ $? == 0 ] && package_pacman=true

package_aptGet=false
[[ $(dpkg -s apt-get &>/dev/null) ]] && [ $? == 0 ] &&  package_aptGet=true

alias ping="ping -c 4"
alias l="ls -ahl --color=auto"
alias h="history -c; rm -f $HOME/.bash_history"
alias c="clear"
alias e="h;c;exit"
alias pw="poweroff"
alias rb="reboot"

alias push="git add . ; git commit -m \"random commit\"; git push"
alias pull="git pull origin master"

alias nodemon="nodemon -e \"hbs js css html\""

if [[ "$package_pacman" = true ]]; then
  alias install="sudo pacman -Sy"
  alias upgrade="sudo pacman -Syu"
fi

if [[ "$package_aptGet" = true ]] ; then
  alias install="sudo apt-get install"
  alias upgrade="sudo apt-get update && sudo apt-get -y upgrade"
fi
