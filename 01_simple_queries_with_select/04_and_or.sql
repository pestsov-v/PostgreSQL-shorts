/* Выбрать все товары из таблицы products, которые имеют стоимость больше 25 и которых в наличии более 40 штук */
SELECT * 
FROM products
WHERE unit_price > 25 AND units_in_stock > 40

/* Выбрать всех продавцов из таблицы customers, которые живут в Берлине, Лондоне или Сан-Франциско */
SELECT * 
FROM customers
WHERE city = 'Berlin' OR city = 'London' OR city = 'San Francisco'

/* Выбрать все заказы из таблицы orders, которые были сделаны позже 1998-04-30 и одновременно с этим весят от 75 до 150 */
SELECT * 
FROM orders
WHERE shipped_date > '1998-04-30' AND (freight < 75 OR freight > 150)

