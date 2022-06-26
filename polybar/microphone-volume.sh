#!/bin/bash
#This script displays microphone status and allows mouse control of volume, mute, as well as launching pavucontrol
#based on a script originally found here: https://github.com/Anachron/i3blocks/blob/master/blocks/microphone

bar=$(amixer get Capture | tail -n 1)
status=$(echo "${bar}" | grep -wo "on")
volume=$(echo "${bar}" | awk -F ' ' '{print $4}' | tr -d '[]%')

if [[ "${status}" == "on" ]]; then
  echo "Vol ${volume}%"
else
  echo "Mute"
fi
