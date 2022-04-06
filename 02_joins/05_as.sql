SELECT COUNT(*) AS employees_count
FROM employees

SELECT COUNT(DISTINCT country) AS country
FROM employees

SELECT category_id, SUM(units_in_stock) AS units_in_Stock
FROM products
GROUP BY category_id
ORDER BY units_in_stock DESC
LIMIT 5