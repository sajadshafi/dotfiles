#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
# polybar left 2>&1 | tee -a /tmp/polybar1.log & disown
# polybar center 2>&1 | tee -a /tmp/polybar2.log & disown
# polybar right 2>&1 | tee -a /tmp/polybar2.log & disown

polybar i3_menu 2>&1 | tee -a /tmp/i3_menu.log & disown
polybar i3_workspaces 2>&1 | tee -a /tmp/i3_workspaces.log & disown
polybar i3_center_clock 2>&1 | tee -a /tmp/i3_center_xwindow_clock.log & disown
polybar i3_sysdetails 2>&1 | tee -a /tmp/i3_sysdetails.log & disown
polybar i3_cava 2>&1 | tee -a /tmp/i3_powermenu_bar.log & disown
polybar i3_powermenu_bar 2>&1 | tee -a /tmp/i3_cava.log & disown

# Cava: show on HDMI-0 if connected, otherwise fall back to primary
if xrandr --query | grep -q "HDMI-0 connected"; then
    MONITOR=HDMI-0 polybar hdmi_cava 2>&1 | tee -a /tmp/hdmi_cava.log & disown
    MONITOR=HDMI-0 polybar i3_workspaces_mon_2 2>&1 | tee -a /tmp/i3_workspaces_mon_2.log & disown
    MONITOR=HDMI-0 polybar i3_heart_second 2>&1 | tee -a /tmp/i3_heart_second.log & disown
else
    MONITOR=DP-4 polybar i3_cava 2>&1 | tee -a /tmp/i3_cava.log & disown
fi

if xrandr --query | grep -q "HDMI-0 connected"; then
    MONITOR=HDMI-0 polybar hdmi_clock 2>&1 | tee -a /tmp/hdmi_clock.log & disown
    MONITOR=HDMI-0 polybar hdmi_media 2>&1 | tee -a /tmp/hdmi_media.log & disown
fi


echo "Bars launched..."
