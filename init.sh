#!/bin/bash

# TODO: find a way to make it work at startup (X starts after this script and conky cannot run properly) 

conkydir="$HOME/.config/conky"
baseurl="https://apod.nasa.gov/apod/"
logfile="$conkydir/logs/$(date +'%Y%m%d%H%M%S').log"
mkdir -p "$conkydir/logs"
mkdir -p "$conkydir/img"

echo "Launching conky, please wait..."
exec &> "$logfile"

imageurl=$(curl $baseurl | grep "<a href=\"image" | grep -oP '[0-9]+\/\w+.\w+')
curl -o "$conkydir/img/image.jpg" "$baseurl/image/$imageurl"

conky -d -c "$conkydir/conky.conf"
echo "Conky launched !"