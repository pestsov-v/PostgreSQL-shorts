/* Выбрать столбец ship_country из таблицы orders и сложить все значения веса freight, которые меньше 0. 
Згрупировать по столбцу ship_country. Вывести список по убыванию веса */
SELECT ship_country, COUNT(*)
FROM orders
WHERE freight > 50
GROUP BY ship_country
ORDER BY COUNT(*) DESC

/* Выбрать столбец category_id и просумированный результат units_in_stock из таблицы products и згрупировать их по category_id.
Вывести список по убыванию сумм units_in_stock */
SELECT category_id, SUM(units_in_stock)
FROM products
GROUP BY category_id
ORDER BY SUM(units_in_stock) DESC
LIMIT 5