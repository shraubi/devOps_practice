#!/bin/bash

if [ "$(id -u)" = "0" ]; then
    echo "This script is running by root user"
else
    echo "This script is NOT running by root user"
fi