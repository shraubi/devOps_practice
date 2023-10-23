#!/bin/bash

threshold=10
log_file="/var/log/disk_manager.log"

log() {
    local message="$1"
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $message" >> "$log_file"
}

# Функция для отображения текущей статистики
stats() {
    df -h
}

# Функция для проверки свободного места и отправки предупреждения
check_space() {
    local disk="$1"
    local free_space=$(df -h "$disk" | awk 'NR==2 {print $5}' | cut -d'%' -f1)

    if [ "$free_space" -lt "$threshold" ]; then
        log "Предупреждение: На диске $disk осталось меньше $threshold% свободного места."
    fi
}

# Функция для очистки устаревших файлов
cleanup() {
    local disk="$1"
    local dir_to_clean="/tmp"

    find "$dir_to_clean" -type f -mtime +7 -exec rm -f {} \+
    log "Очистка устаревших файлов в $dir_to_clean на диске $disk выполнена."
}

# Основной цикл для обхода дисков
main() {
    disks=$(df -h | awk '{if(NR>1) print $6}')
    for disk in $disks; do
        stats
        check_space "$disk"
        cleanup "$disk"
    done
}

# Обработка аргументов командной строки
case "$1" in
    "stats")
        stats
        ;;
    "check_space")
        main
        ;;
    "cleanup")
        main
        ;;
    *)
        echo "Использование: $0 {stats|check_space|cleanup}"
        exit 1
        ;;
esac

exit 0
