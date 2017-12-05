#!/bin/bash

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
    echo -e "[$2]	$3 [Error: $1]"
  else
    [[ $outputVerbose == "true" ]] && echo -e "[$2]	$3 [code: $1]"
  fi
  [[ $outputDebug == "true" ]] && echo -e "[$2]	$3 * $1" >> error.log
}

createConfiguration() {
  if [[ ! $1 ]]; then
    resetConfiguration
    for configurationKey in ${configurationKeys[@]}
          do
            read -p "Type $configurationKey:" value
            echo "$configurationKey=($value)" >> $HOME/qwwq/scriptLoader.conf
          done
          chmod +x $HOME/qwwq/scriptLoader.conf
          loadConfiguration
  elif [[ $1 && $2 ]]; then
    echo "$1=($2)" >> $HOME/qwwq/scriptLoader.conf
    loadConfiguration
  else
    output "1" "Bad arguments." "Type $HOME/qwwq/scriptLoader.sh --help for further information."
    helpScreen
  fi

}

loadConfiguration() {
  [[ ! -f $HOME/qwwq/scriptLoader.conf ]]  && createConfiguration
  [[ -f $HOME/qwwq/scriptLoader.conf ]] && . $HOME/qwwq/scriptLoader.conf
}

resetConfiguration() {
	echo "to do."
}

update() {
  lastErrorCode="0"
  output $lastErrorCode $HOME/qwwq/scriptLoader.sh "Starting update."
  curl -z $HOME/qwwq/$HOME/qwwq/scriptLoader.sh -o $HOME/qwwq/$HOME/qwwq/scriptLoader.sh $downloadUri &> /dev/null &
  lastErrorCode=$?
  output $lastErrorCode $HOME/qwwq/scriptLoader.sh "End of update."
  exit 0
  #exit $lastErrorCode
}

badArguments() {
  output $lastErrorCode "INSUFFICIENT ARGUMENTS" "Please type $HOME/qwwq/scriptLoader.sh --help for further information"
  helpScreen
}
