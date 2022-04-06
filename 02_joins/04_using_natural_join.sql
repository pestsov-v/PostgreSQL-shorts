/* Выбрать столбцы contanct_name, company_name, phone, first_name, last_name, title,
order_date, product_name, ship_country, product.unit_price, quantity, discount из таблицы orders. 
При этом внутренним соединением связать данные 
из order_details у которого внешний ключ order_id соотносится к primary key order_id,
из products у которого внешний ключ product_id соотносится к primary key product_id,
из customers у которого внешний ключ customer_id соотносится к primary key customer_id,
из employees у которого внешний ключ employee_id соотносится к primary key employee_id
и в результирующий набор попадают только те строки, где ship_country = 'USA' */
SELECT contanct_name, company_name, phone, first_name, last_name, title,
       order_date, product_name, ship_country, product.unit_price, quantity, discount
FROM orders
JOIN order_details ON orders.order_id = order_details.order_id
JOIN products ON order_details.product_id = products.product_id
JOIN customers ON orders.customer_id = customers.customer_id
JOIN employees ON orders.employee_id = employees.employee_id
WHERE ship_country = 'USA'

/* Аналогично верхнему запросу. Разница лишь в использовани USING, если название столбцов одноимённые */
SELECT contanct_name, company_name, phone, first_name, last_name, title,
       order_date, product_name, ship_country, product.unit_price, quantity, discount
FROM orders
JOIN order_details USING(order_id)
JOIN products ON USING(product_id)
JOIN customers ON USING(customer_id)
JOIN employees ON USING(employee_id)
WHERE ship_country = 'USA'

/* Выбрать столбцы order_id, customer_id, first_name, last_name, title 
из таблицы orders при этом объеденить внутренним соединением JOIN 
(или INNER JOIN) с таблицею employees по одноимённым названиям столбцов */
SELECT order_id, customer_id, first_name, last_name, title
FROM orders
NATURAL JOIN employees
