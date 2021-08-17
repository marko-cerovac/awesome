#!/bin/bash

[ $(echo -e "Yes\nNo" | dmenu -c -l 2 -p "$1") \
    == "Yes" ] && $2
