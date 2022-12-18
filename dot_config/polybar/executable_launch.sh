#!/usr/bin/env sh

kill -9 $(pidof polybar)

if type "xrandr"; then                                                                                                  ─╯
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload default &
  done
else
  polybar --reload default &
fi
