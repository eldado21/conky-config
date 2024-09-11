#!/bin/bash

conkydir="$HOME/.config/conky/"

mkdir -p "$conkydir/logs"
exec conky -d -c "$conkydir/conky.conf" &> "$conkydir/logs/$(date +'%Y%m%d%H%M%S').log"