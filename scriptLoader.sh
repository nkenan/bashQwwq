#!/bin/bash

### ******* BEST FUNCTIONS *******
version="0.0.9rc"
scriptDirectory="/home/nzm/qwwq"
script="scriptLoader.sh"
downloadUri="http://nzm.mirfac.uberspace.de/qwwq/$script" #config

outputError=true #config
outputVerbose=true #config
outputDebug=true #config

scriptFiles=(aliases.sh secret.sh) #config
clients=(nzm@mirfac.uberspace.de p5005@sirius.uberspace.de) #config

mainFunction() {
  lastErrorCode="0"
  ###
  for scriptFile in ${scriptFiles[@]}
        do
          [[ -f $scriptDirectory/$scriptFile ]] && . $scriptDirectory/$scriptFile
          lastErrorCode=$?
          output $lastErrorCode $scriptFile "Executed and returned:"
        done
}
clientsUpdate() {
  for client in ${clients[@]}
  do
    ssh $client 'bash -s $script --main-function'
  done
  exit 0
}
clientsExecute() {
  for client in ${clients[@]}
  do
    ssh $client 'bash -s' < $1
  done
  exit 0
}
### ******* END OF BEST FUNCTIONS *******


### ******* QWWQ *******
update() {
  lastErrorCode="0"
  output $lastErrorCode $script "Starting update."
  curl -z $scriptDirectory/$script -o $scriptDirectory/$script $downloadUri &> /dev/null &
  lastErrorCode=$?
  output $lastErrorCode $script "End of update."
  exit $lastErrorCode
}
help() {
  echo -e "
  --update
  --help
  --reset-configuration

  --main-function
  --clients-update
  --clients-execute
  "
  exit 0
}
resetConfiguration() {
  [[ -f $script.conf ]] && rm -rf $script.conf &> /dev/null
  exit 0
}
output() {
  ## $1: error code
  ## $2: filename or other name
  ## $3: short message

  if [[ $outputError = true ]] ; then
    [[ $1 != "0" ]] && echo -e "[$2] $3 [Error: $1]"
  else
    [[ $outputVerbose == true ]] && echo -e "[$2] $3 [code: $1]"
  fi

  [[ $outputDebug == true ]] && echo -e " [$2] $3 * $1" >> error.log
}

badArguments() {
  output $lastErrorCode "INSUFFICIENT ARGUMENTS" "Please type $script --help for further information"
  exit $lastErrorCode
}
### ******* END OF QWWQ *******


### ******* LOGIC *******
[[ "$1" == '' ]] && lastErrorCode="2" && badArguments

while [ "$1" != '' ]
  do
    [[ $1 == "--update" ]] && update && shift
    [[ $1 == "--help" ]] && help && shift
    [[ $1 == "--reset-configuration" ]] && resetConfiguration && shift

    [[ $1 == "--main-function" ]] && mainFunction && shift

    [[ $1 == "--clients-update" ]] && clientsUpdate  $2 && shift && shift
    [[ $1 == "--clients-execute" ]] && clientsExecute $2 && shift && shift
  done
### ******* END OF LOGIC *******
