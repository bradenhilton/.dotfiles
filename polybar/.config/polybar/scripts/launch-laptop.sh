#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch main bar
echo "---" | tee -a /tmp/polybar_main.log /tmp/polybar_left.log
polybar main >>/tmp/polybar_main.log 2>&1 &

echo "Polybar launched..."