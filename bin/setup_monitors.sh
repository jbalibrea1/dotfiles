#!/bin/bash

sleep 1

xrandr --output DP-0 --mode 1920x1080 --rate 239.76 --primary
xrandr --output HDMI-0 --rotate left --left-of DP-0
feh --bg-fill /home/jbalibrea/Pictures/wallhaven-vmk29p.jpg   
