#!/bin/bash

cat /proc/cpuinfo | grep "model name" | head -n 1 | cut -d":" -f 2 | cut -c 20-