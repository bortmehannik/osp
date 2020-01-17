#!/bin/bash
welcome() {
	echo "Добро пожаловать! Выберите действие:"
	echo "[1] Напечатать имя текущего каталога"
	echo "[2] Напечатать содержимое текущего каталога"
	echo "[3] Вывести текущую дату и время в формате Wed Feb 2 01:01 MSK 2015"
	echo "[4] Вывести содержимое файла на экран"
	echo "[5] Удалить файл"
	echo "[6] Выйти из программы"
}

log_file=./lab1_err

while true :
do
	welcome
	read menu_item
	case $menu_item in
		1)
			basename "$PWD"
		;;
		2)
			ls -- 2>> $log_file || echo "Ошибка: не удалось просмотреть содержимое каталога" >&2
		;;
		3)
			export LC_ALL=en_US.utf8; date '+%a %b %d %H:%M %Z %Y'
		;;
		4)
			IFS=
			echo "Введите путь к файлу, содержимое которого хотите вывести:"
			read -r file_path || exit 0
			if [ -f "$file_path" ]
			then
				cat -- "$file_path" 2>> $log_file || echo "Ошибка: не удалось просмотреть файл '$file_path'" >&2
			else
				echo "Ошибка: файл $file_path не существует" >&2
			fi
		;;
		5)
			IFS=
			echo "Введите путь к файлу, который хотите удалить:"
			read -r file_path || exit 0
			if [ -f "$file_path" ]
			then
				echo "rm: remove file $file_path (yes/no)?"
				read -r answer || exit 0
				if [ "$answer" = yes ] || [ "$answer" = y ]
				then
					rm -- "$file_path" 2>> $log_file || echo "Ошибка: не удалось удалить файл '$file_path'" >&2
				fi
			else
				echo "Ошибка: файл $file_path не существует" >&2
			fi
		;;
		6)
			echo "Пока"
			exit 0
		;;
		*)
			if [ $? -eq 1 ]
			then
				echo "Пока"
				exit 0
			else
				echo "Ошибка: такой пункт меню отсутствует, выберите другой" >&2
			fi
		;;
	esac
done