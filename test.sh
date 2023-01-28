#!/bin/sh

Xephyr -screen 1440x810 :5 & sleep 1; DISPLAY=:5 awesome
