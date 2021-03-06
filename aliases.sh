#!/bin/bash
###############################################################
shopt -s expand_aliases
###############################################################
package_pacman=false;
pacman -Q pacman &> /dev/null && package_pacman=true

package_apt_get=false
dpkg -s apt &> /dev/null && package_apt_get=true
###############################################################
alias ping="ping -c 4"
alias l="ls -ahl --color=auto"
alias h="history -c; rm -f $HOME/.bash_history"
alias c="clear"
alias e="h;c;exit"
alias pw="poweroff"
alias rb="reboot"
###############################################################
alias push="git add . && git commit -m \"shell-generated commit\" && git push"
alias pull="git pull origin master"
###############################################################
[ "$package_apt_get" ] &&
alias install="sudo apt-get install" &&
alias upgrade="sudo apt-get update && sudo apt-get -y upgrade"

[ "$package_pacman" ] && 
alias install="sudo pacman -Sy" && 
alias upgrade="sudo pacman -Syu"
###############################################################
return 0;
