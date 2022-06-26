#!/bin/bash
#This script displays microphone status and allows mouse control of volume, mute, as well as launching pavucontrol

MIC_ON_SYMBOL=
MIC_MUTED_SYMBOL=


bar=$(amixer get Capture | tail -n 1)
status=$(echo "${bar}" | grep -wo "on")

if [[ "${status}" == "on" ]]; then
  echo "$MIC_ON_SYMBOL " 
else
  echo "$MIC_MUTED_SYMBOL "
fi

# Audio Profiles
pacmd set-card-profile alsa_card.pci-0000_09_00.1 off #Pc-Jack
pacmd set-card-profile alsa_card.usb-Sonix_Technology_Co.__Ltd._Rapoo_Camera_SN0001-02 off #WebCam
pacmd set-card-profile alsa_card.usb-GeneralPlus_USB_Audio_Device-00 output:analog-stereo+input:mono-fallback #Usb-Headset
pacmd set-card-profile alsa_card.pci-0000_09_00.6 off #Pc-Jack
