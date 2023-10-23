#!/bin/bash

source_file="$HOME/my_file.txt"

target_directory="/tmp"

if [ -f "$source_file" ]; then
  cp "$source_file" "$target_directory"
  echo "File $source_file had been copied into $target_directory."
else
  echo "File $source_file has not been found."
fi