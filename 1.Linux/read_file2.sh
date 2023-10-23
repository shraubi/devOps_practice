#!/bin/bash

read -p "Имя файла: " file_name

if [ -f "$file_name" ]; then
  echo "Содержимое файла $file_name:"
  cat "$file_name"
else
  echo "Файл $file_name не существует."
fi
