/* Выбрать столбцы company_name, contact_name из таблицы customers, 
где результирующий набор подзапроса является фильтром. 
EXISTS означает, что в результирующий набор попадают те элементы, 
которые проходят условие подзапроса.
Подзапрос: выбрать столбец customer_id из таблицы orders, 
где вес freight равен от 0 до 100 */
SELECT company_name, contact_name
FROM customers
WHERE EXISTS(SELECT customer_id 
             FROM orders
             WHERE customer_id = customers.customer_id
             AND freight BETWEEN 0 and 100)

/* Выбрать столбцы company_name, contact_name из таблицы customers, 
где результирующий набор подзапроса является фильтром. 
Подзапрос: выбрать столбец customer_id из таблицы orders, 
где заказы order_date были сделаны между 1995-02-1 и 1995-02-15 */
SELECT company_name, contact_name
FROM customers
WHERE EXISTS(SELECT customer_id 
             FROM orders
             WHERE customer_id = customers.customer_id
             AND order_date BETWEEN '1995-02-01' AND '1995-02-15')

/* Выбрать столбец из таблицы где все результаты, 
которые не попадил в результирующий запрос являются фильтром. 
Подзапрос: выбрать столбец order_id из таблицы orders объеденив 
при этом по одноименному столбцу с order_details, 
где внешний ключ order_details.product_id = product_id и 
заказы order_date были сделаны между 1995-02-1 и 1995-02-15  */
SELECT product_name
FROM products
WHERE NOT EXISTS(SELECT orders.order_id  
                 FROM orders
                 JOIN order_details USING(order_id)
                 WHERE order_details.product_id = product_id
                 AND order_date BETWEEN '1995-02-01' AND '1995-02-15')
             