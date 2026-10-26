#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Ошибка! Используйте: $0 <количество> <длина>"
    exit 1
fi

count=$1
length=$2

generate_password() {
    local len=$1
    local password=$(tr -dc 'A-Za-z0-9' < /dev/urandom | head -c $len)
    echo "$password"
}

for (( i=1; i<=count; i++ ))
do
    local pass=$(generate_password $length) 2>/dev/null || pass=$(generate_password $length)
    echo "Пароль $i: $pass"
done
