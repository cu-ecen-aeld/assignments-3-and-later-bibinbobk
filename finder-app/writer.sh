#!/bin/sh
# A writer app
# Created by: bibinbobk
# Date: 15-Nov-2023

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 error" >&2
    echo "Expecting Two arguments --------"
    echo "--- argument 1: path to a file"
    echo "--- argument 2: file content" 
    exit 1
fi
if ! [ -e $(dirname "$1") ]; then
    echo "$1 directory not found" >&2
    exit 1
fi
if ! [ -d $(dirname "$1") ]; then
    echo "$1 not a directory" >&2
    exit 1
fi

echo "$2" > $1