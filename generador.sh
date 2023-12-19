#!/bin/bash

$VAR = $echo (($RANDOM%3))
if $VAR = 1
ffmpeg -f lavfi -i "anoisesrc=a=0.1:c=white:duration=5" out.wav
if $VAR = 2
convert -size 100x100 xc: +noise Random noise.png
if VAR = 3
base64 /dev/urandom | head -c 500 > file.txt 