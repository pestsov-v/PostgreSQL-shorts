/* Посчитать количество строк в таблице employees и 
подписать результирующий столбец employees_count */
SELECT COUNT(*) AS employees_count
FROM employees

/* Посчитать количество уникальных строк в столбце country
из таблицы employees и подписать результирующий столбец country */
SELECT COUNT(DISTINCT country) AS country
FROM employees

/* Выбрать столбец category_id, и подсчитать сумму 
каждой из категории - units_in_stock. При этом столбец из 
подсчитанной суммы units_in_stock подписать units_in_Stock.
Сгрупировать по категориям. 
Отсортировать по итоговой стоимости units_in_stock по убыванию
И ограничить результирующий выбор 5 элемента */
SELECT category_id, SUM(units_in_stock) AS units_in_Stock
FROM products
GROUP BY category_id
ORDER BY units_in_stock DESC
LIMIT 5