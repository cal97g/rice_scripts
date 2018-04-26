#!/bin/bash

PAPES=/home/<YOUR_USER>/Pictures/papes/*
source /home/<YOUR_USER>/Documents/venvs/pywal/bin/activate

for pape in $PAPES
do
  echo "setting the pape: $pape"
  wal -i $pape
  sleep 1800
done
