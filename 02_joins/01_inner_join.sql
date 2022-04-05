/* Выбрать столбцы product_name, supplies.company_name, units_in_stock из 
таблицы товаров products и заменить данные с соответствие внешннего ключа 
supplies.company_name  к suppliers.supplier_id */
SELECT product_name, supplies.company_name, units_in_stock
FROM products
INNER JOIN supplies ON products.supplier_id = suppliers.supplier_id

/* Выбрать столбцы category_name и сумму SUM(units_in_stock) из 
таблицы товаров products при этом заменить данные с соответствием внешнего ключа 
products.category_id к categories.category_id */
SELECT category_name, SUM(units_in_stock)
FROM products
INNER JOIN categories ON products.category_id = categories.category_id
GROUP BY catygory_name
ORDER BY SUM(units_in_stock) DESC
LIMIT 5

/* Выбрать столбцы category_name и сумму стоимости всех товаров SUM(unit_price * unit_in_stock)
из таблицы products и заменить данные с соответствие внешннего ключа 
products.category_id к categories.category_id, где товары являются не распродаваемыми.
После чего сгрупировать по category_name и вывести только те строки,
где сумма SUM (unit_price * units_in_stock) больше 5000.
После чего отсортировать по убыванию ORDER BY  SUM (unit_price * units_in_stock) DESC */
SELECT category_name, SUM(unit_price * unit_in_stock)
FROM products
INNER JOIN categories ON products.category_id = categories.category_id
WHERE discountinued != 1
GROUP BY category_name
HAVING SUM (unit_price * units_in_stock) > 5000
ORDER BY  SUM (unit_price * units_in_stock) DESC

/* Выбрать столбцы order_date, product_name, ship_country, unit_price, quantity, discount
из таблицы orders, при этом заменить данные с соответствие внешннего ключа 
orders.order_id к order_details.order_id и orders.products_id к products.products_id */
SELECT order_date, product_name, ship_country, unit_price, quantity, discount
FROM orders
INNER JOIN order_details ON orders.order_id = order_details.order_id
INNER JOIN products ON orders.products_id = products.products_id
