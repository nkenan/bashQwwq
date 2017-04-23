#!/bin/bash

shopt -s expand_aliases

package_pacman=false;
pacman -Q pacman &> /dev/null && package_pacman=true

package_aptitude=false
dpkg -s aptitude &> /dev/null && package_aptitude=true

alias ping="ping -c 4"
alias l="ls -ahl --color=auto"
alias h="history -c; rm -f $HOME/.bash_history"
alias c="clear"
alias e="h;c;exit"
alias pw="poweroff"
alias rb="reboot"

alias push="git add . ; git commit -m \"random commit\"; git push"
alias pull="git pull origin master"

alias atom="sudo atom ~/espdev/espQwwq"
alias nodemon="nodemon -e \"hbs js css html\""

if [[ "$package_aptitude" == true ]] ; then
  echo "aptGet TRUE"
  alias install="sudo apt-get install"
  alias upgrade="sudo apt-get update && sudo apt-get -y upgrade"
else
echo "apGet FALSE"
fi
if [[ "$package_pacman" == true ]]; then
  echo "pacman TRUE"
  alias install="sudo pacman -Sy"
  alias upgrade="sudo pacman -Syu"
else 
echo "pacman FALSE"
fi
