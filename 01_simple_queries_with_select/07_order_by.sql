/* Выбрать все уникальные страны из таблицы customers, при этом сгрупировать их по возрастанию  */
SELECT DISTINCT country
FROM customers
ORDER BY country ASC

/* Выбрать все уникальные страны из таблицы customers, при этом сгрупировать их по убыванию */
SELECT DISTINCT country
FROM customers
ORDER BY country DESC

/* Выбрать все уникальные страны из таблицы customers, при этом сгрупировать их по убыванию, а после в каждом стране сгрупировать city по убыванию */
SELECT DISTINCT country,city 
FROM customers
ORDER BY country DESC, city DESC