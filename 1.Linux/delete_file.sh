#!/bin/bash

file_to_delete="$HOME/my_file.txt"

if [ -f "$file_to_delete" ]; then
  rm "$file_to_delete"
  echo "File $file_to_delete had been deleted."
else
  echo "File $file_to_delete has not been found or was previously deleted."
fi
