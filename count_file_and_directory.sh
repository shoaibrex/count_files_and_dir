#!/bin/bash

# Check if a directory path was provided as an argument
if [ $# -eq 0 ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

directory="$1"

# Check if the provided directory exists
if [ ! -d "$directory" ]; then
  echo "Directory '$directory' does not exist."
  exit 1
fi

# Count the number of files and subdirectories in the directory
file_count=0
dir_count=0

for item in "$directory"/*; do
  if [ -f "$item" ]; then
    ((file_count++))
  elif [ -d "$item" ]; then
    ((dir_count++))
  fi
done

echo "Number of files: $file_count"
echo "Number of directories: $dir_count"

# List the largest files in the directory
echo "Top 3 Largest files in '$directory':"
find "$directory" -type f -exec ls -s {} + | sort -nr | head -3

echo

# List the smallest files in the directory
echo "Top 3 smallest files in '$directory':"
find "$directory" -type f -exec ls -s {} + | sort -n | head -3


