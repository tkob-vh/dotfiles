#/bin/bash

# A shell script used to minimize the current active window in hyprland.

xdotool windowunmap $(xdotool getactivewindow)
