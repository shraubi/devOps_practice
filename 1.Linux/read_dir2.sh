#!/bin/bash

read -p "Имя каталога: " file_name

if [ -d "$file_name" ]; then
  echo "Файлы в каталоге $file_name:"
  ls "$file_name"
else
  echo "Каталога $file_name не существует."
fi
