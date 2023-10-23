#!/bin/bash

read -p "Имя каталога: " file_name

echo "Файлы в каталоге $file_name:"
ls "$file_name"

