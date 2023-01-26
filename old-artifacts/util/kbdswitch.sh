#!/bin/sh

OPTIONS=(
    "us"
    "sr - cyrilic"
    "sr - latin"
    )

CHOICE=$(printf '%s\n' "${OPTIONS[@]}" | dmenu -c -l 3 -p "Keyboard layouts")

if [[ "$CHOICE" == "us" ]]; then 
    setxkbmap -layout us
elif [ "$CHOICE" == "sr - cyrilic" ]; then
    setxkbmap -layout rs
elif [ "$CHOICE" == "sr - latin" ]; then
    setxkbmap -layout rs -variant latin
fi
