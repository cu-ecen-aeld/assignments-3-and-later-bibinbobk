#!/bin/sh
# A finder app
# Created by: bibinbobk
# Date: 15-Nov-2023

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 error" >&2
    echo "Expecting Two arguments --------"
    echo "--- argument 1: path to a directory"
    echo "--- argument 2: search string" 
    exit 1
fi
if ! [ -e "$1" ]; then
    echo "$1 directory not found" >&2
    exit 1
fi
if ! [ -d "$1" ]; then
    echo "$1 not a directory" >&2
    exit 1
fi

# grep -Rnw '/home/bibinbobk/Course/Linux/assignment_1/aesd-assignments' -e 'finder'
# grep -Rnw '$1' -e '$2'
output_X=$(grep -Rwcls "$1" -e "$2" | wc -l)
output_Y=$(grep -Rwos "$1" -e "$2" | wc -l)

echo "The number of files are $output_X and the number of matching lines are $output_Y"