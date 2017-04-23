#!/bin/bash
script="scriptLoader.sh"
scriptConfig="scriptLoader.conf"

scriptDirectory="$HOME/qwwq"
configurationKeys=(clients scriptFiles)
outputError=true #config
outputVerbose=true #config
outputDebug=true #config
useTmux=false

output() {
  ## $1: error code
  ## $2: filename or other name
  ## $3: short message
  if [[ $outputError == "true" ]] ; then
    echo -e "[$2] $3 [Error: $1]"
  else
    [[ $outputVerbose == "true" ]] && echo -e "[$2] $3 [code: $1]"
  fi
  [[ $outputDebug == "true" ]] && echo -e " [$2] $3 * $1" >> error.log
}

createConfiguration() {
  if [[ ! $1 ]]; then
    resetConfiguration
    for configurationKey in ${configurationKeys[@]}
          do
            read -p "Type $configurationKey:" value
            echo "$configurationKey=($value)" >> $scriptDirectory/$scriptConfig
          done
          chmod +x $scriptDirectory/$scriptConfig
          loadConfiguration
  elif [[ $1 && $2 ]]; then
    echo "$1=($2)" >> $scriptDirectory/$scriptConfig
    loadConfiguration
  else
    output "1" "Bad arguments." "Type $script --help for further information."
    helpScreen
  fi

}

loadConfiguration() {
  [[ ! -f $scriptDirectory/$scriptConfig ]] && createConfiguration
  [[ -f $scriptDirectory/$scriptConfig ]] && . $scriptDirectory/$scriptConfig
}

update() {
  lastErrorCode="0"
  output $lastErrorCode $script "Starting update."
  curl -z $scriptDirectory/$script -o $scriptDirectory/$script $downloadUri &> /dev/null &
  lastErrorCode=$?
  output $lastErrorCode $script "End of update."
  exit 0
  #exit $lastErrorCode
}

badArguments() {
  output $lastErrorCode "INSUFFICIENT ARGUMENTS" "Please type $script --help for further information"
  helpScreen
}
#loadConfiguration
