#!/bin/bash
# Compare two file's modification times
# Ubuntu-friendly version

file1="$HOME/Downloads/games.rpm"
file2="$HOME/software/games.rpm"

if [ "$file1" -nt "$file2" ]; then
    echo "The $file1 file is newer"
    echo "than the $file2 file."
else
    echo "The $file1 file is older"
    echo "than the $file2 file."
fi

