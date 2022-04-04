/* Объеденить все строки столбцов country из таблиц customers и employees. 
Значения при этом будут уникальные */
SELECT country 
FROM customers
UNION
SELECT country 
FROM employees

/* Объеденить все строки столбцов country из таблиц customers и employees. 
При этом будут получены абсолютно все значения */
SELECT country 
FROM customers
UNION ALL
SELECT country 
FROM employees

/* Вывести все строки столбцов country из таблиц customers и employees, которые пересекаются. 
Значения при этом будут уникальные */
SELECT country 
FROM customers
INTERSECT
SELECT country 
FROM employees

/* Вывести все строки столбцов country из таблиц customers и employees, которые пересекаются. 
При этом будут получены абсолютно все значения */
SELECT country 
FROM customers
INTERSECT ALL
SELECT country 
FROM employees

/* Вывести все строки столбцов country из таблиц customers и employees, которые не пересекаются. 
Значения при этом будут уникальные */
SELECT country 
FROM customers
EXCEPT
SELECT country 
FROM employees

/* Вывести все строки столбцов country из таблиц customers и employees, которые не пересекаются. 
При этом будут получены абсолютно все значения */
SELECT country 
FROM customers
EXCEPT ALL
SELECT country 
FROM employees
