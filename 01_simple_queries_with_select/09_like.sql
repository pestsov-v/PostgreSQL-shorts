/* Выбрать столбцы last_name, first_name из таблицы employees. 
После чего выбрать те строки, где first_name заканчиваются на n */
SELECT last_name, first_name
FROM employees
WHERE first_name LIKE '%n'

/* Выбрать столбцы last_name, first_name из таблицы employees. 
После чего выбрать те строки, где first_name начинаются на B */
SELECT last_name, first_name
FROM employees
WHERE first_name LIKE 'B%'

/* Выбрать столбцы last_name, first_name из таблицы employees. 
После чего выбрать те строки, где first_name начинаются на Buch */
SELECT last_name, first_name
FROM employees
WHERE first_name LIKE 'Buch%'

/* Выбрать столбцы last_name, first_name из таблицы employees. 
После чего выбрать те строки, где first_name начинается со второй строки ch */
SELECT last_name, first_name
FROM employees
WHERE first_name LIKE '_ch%'
