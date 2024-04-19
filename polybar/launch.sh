#!/usr/bin/env bash

polybar-msg cmd quit
killall polybar

echo "---" | tee -a /tmp/polybar-top1.log /tmp/polybar-top2.log 
polybar top1 2>&1 | tee -a /tmp/polybar-top1.log & disown
polybar top2 2>&1 | tee -a /tmp/polybar-top2.log & disown
