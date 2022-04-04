/* Выбрать столбцы company_name, contact_name, phone, country, где в столбце country = USA */
SELECT company_name, contact_name, phone, country
FROM country
WHERE country = 'USA'

/* Выбрать все товары из таблицы products, у которых цена unit_price больше 20 */
SELECT *
FROM products
WHERE unit_price > 20

/* Выбрать все уникальные товары из таблицы products, у которых цена unit_price больше 20 */
SELECT COUNT(*)
FROM products
WHERE unit_price > 20


/* Выбрать все товары у которых город не равно Berlin */
SELECT *
FROM products
WHERE city <> 'Berlin'

/* Выбрать все заказы, которые были сделаны раньше 1998-03-01  */
SELECT *
FROM orders
WHERE order_date > '1998-03-01'

