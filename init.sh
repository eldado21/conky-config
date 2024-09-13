#!/bin/bash

conkydir="$HOME/.config/conky"
baseurl="https://apod.nasa.gov/apod/"
logfile="$conkydir/logs/$(date +'%Y%m%d%H%M%S').log"
mkdir -p "$conkydir/logs"
mkdir -p "$conkydir/img"

echo "Launching conky, please wait..."
exec &> "$logfile"

# getting APOD
imageurl=$(curl $baseurl | grep "<a href=\"image" | grep -oP '[0-9]+\/\w+.\w+')
curl -o "$conkydir/img/image.jpg" "$baseurl/image/$imageurl"

conky --daemonize --xinerama-head=2 --config="$conkydir/conky.conf"
conky --daemonize --xinerama-head=2 --config="$conkydir/time.conf"