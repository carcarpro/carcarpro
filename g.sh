#!/bin/bash
msg=$1 &&
if [[ $msg ]]; then
    echo "commit msg is $msg"
    git add -A && git commit -m $msg
else
    echo "no commit msg provided, default to ``updates``"
    git add -A && git commit -m "updates"
fi