/* Выбрать колонки ship_city и даты этих заказов order_date з таблицы orders, 
где ship_city является Лондон и сгрупировать по возрастанию по дате */
SELECT ship_city, order_date
FROM orders
WHERE ship_city = 'London'
ORDER BY order_date

/* Выбрать самую позднюю дату заказа из таблицы orders, где ship_сity является London */
SELECT MIN(order_date)
FROM orders
WHERE ship_city = 'London'

/* Выбрать самую ранюю дату заказа из таблицы orders, где ship_сity является London */
SELECT MAX(order_date)
FROM orders
WHERE ship_city = 'London'

/* Выбрать среднюю цену товаров з таблицы товаров products, из товаров, которые не имеют скидок */
SELECT AVG(unit_price)
FROM products
WHERE discounted <> 1