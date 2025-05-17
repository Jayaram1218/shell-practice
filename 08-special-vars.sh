#!/bin/bash

echo "all vaiables passed to the script: $@"

echo "Number of vaiable: $#"

echo "Script name: $0"

echo "present working directory: $PWD"

echo "Home directory of the user who is runnung the script: $HOME"

echo "Which user is running the script: $$"

sleep 10 &

echo "PID of the last command running in background: $!"
