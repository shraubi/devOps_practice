#!/bin/bash

read -p "Введите имя файла: " file_name

if [ -f "$file_name" ]; then
  perl -pi -e 's/error/warning/g' "$file_name"
  echo "Все вхождения слова 'error' заменены на 'warning' в файле $file_name."
else
  echo "Файл $file_name не существует."
fi
