#!/bin/bash

log_dir="/var/log"

found_files=$(find "$log_dir" -type f -exec grep -l "error" {} +)

if [ -z "$found_files" ]; then
    echo "Файлы с текстом 'error' не найдены в каталоге $log_dir."
else
    echo "Найдены следующие файлы, содержащие текст 'error':"
    echo "$found_files"
fi
