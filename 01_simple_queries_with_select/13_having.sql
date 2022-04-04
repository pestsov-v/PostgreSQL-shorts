/* Выбрать столбцы category_id и результирующие суммы сложения строк в столбцах unit_price и unit_in_stock.
из таблицы товаров products, такие товары, какие не находятся на скидке. 
Сгрупировать по category_id.
Вывести те данные, где сумма unit_price и unit_in_stock превышает 5000. 
Сгрупировать результирующий набор по убыванию.*/
SELECT category_id, SUM(unit_price * unit_in_stock)
FROM products
WHERE discontinued <> 1
GROUP BY category_id
HAVING SUM(unit_price * unit_in_stock) > 5000
ORDER BY SUM(unit_price * unit_in_stock) DESC