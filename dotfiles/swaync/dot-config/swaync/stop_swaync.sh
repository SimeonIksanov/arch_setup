#!/usr/bin/env bash

PROCESS_NAME="swaync"

echo "Killing all $PROCESS_NAME processes..."

# Loop until no processes remain
while pgrep -x "$PROCESS_NAME" > /dev/null; do
    pkill -9 "$PROCESS_NAME"
    sleep 0.3
done

echo "All $PROCESS_NAME processes terminated."
