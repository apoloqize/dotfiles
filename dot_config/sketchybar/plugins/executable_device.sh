#!/bin/sh

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.
#MODEL=$(system_profiler SPHardwareDataType | grep "Model Name:" | awk '{print $4}')
#if [ "$MODEL" = "mini" ]; then
#    exit 0
#fi

DEVICE=$(SwitchAudioSource -c)

case "$DEVICE" in
  *"Shure MV7"*) ICON="􀑫"  # Microphone
  ;;
  *"LG ULTRAGEAR+"*) ICON="􀢹"  # High volume speaker
  ;;
  *"JDS Labs Element III"*) ICON="􂛋"  # Headphones
  ;;
  *"Mac mini Speakers"*) ICON="􀪰"  # Medium volume speaker
  ;;
  *) ICON="􀊣"  # Default/muted speaker
  ;;
esac

sketchybar --set "$NAME" icon="$ICON"
