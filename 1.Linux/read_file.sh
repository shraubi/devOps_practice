#!/bin/bash

read -p "Имя файла: " file_name

echo "Содержимое файла $file_name:"
cat "$file_name"

