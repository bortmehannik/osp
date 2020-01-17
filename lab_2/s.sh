#!/bin/bash
menu() {
	echo "Добро пожаловать! Выберите действие:"
	echo "[1] Напечатать имя текущего каталога"
	echo "[2] Напечатать содержимое текущего каталога"
	echo "[3] Вывести текущую дату и время в формате Wed Feb 2 01:01 MSK 2015"
	echo "[4] Вывести содержимое файла на экран"
	echo "[5] Удалить файл"
	echo "[6] Выйти из программы"
}

bye() {
	local ex_code=$?
	if [ $# -ne 0 ]; then
		echo -ne "$1"
	fi
	if [ $ex_code -ne 0 ]; then
		echo -e "\t$ex_code\t"
	fi
	echo "До новых встреч!"
	exit $ex_code
}

clear screen
log_file=./lab1_err
while true :
do
	menu
	read menu_item
	case $menu_item in
		1)
			basename "$PWD";;
		2)
			ls -- 2>> $log_file || echo "Ошибка: не удалось просмотреть содержимое каталога" >&2;;
		3)
			export LC_ALL=en_US.utf8; date '+%a %b %d %H:%M %Z %Y';;
		4)
			IFS=
			echo "Введите путь к файлу: "
			read -r file_path || bye "Ошибка чтения потока ввода:"
			if [ -f "$file_path" ]; then
				cat -- "$file_path" 2>> $log_file || echo "Ошибка: не удалось просмотреть файл '$file_path'" >&2
			else
				echo "Ошибка: файл $file_path не существует" >&2
			fi;;
		5)
			IFS=
			echo "Введите путь к удаляемому файлу: "
			read -r file_path || bye "Ошибка чтения потока ввода:"
			if [ -f "$file_path" ]; then
				echo "rm: remove file $file_path (yes/no)?"
				read -r answer || bye "Ошибка чтения потока ввода:"
				if [ "$answer" = yes ] || [ "$answer" = y ]; then
					rm -- "$file_path" 2>> $log_file || echo "Ошибка: не удалось удалить файл '$file_path'" >&2
				fi
			else
				echo "Ошибка: файл $file_path не существует" >&2
			fi;;
		6)
			bye;;
		*)
			if [ $? -eq 1 ]; then
				bye
			else
				echo "Ошибка: выбранный пункт меню отсутствует, пожалуйста повторите ввод..." >&2
			fi;;
	esac
done