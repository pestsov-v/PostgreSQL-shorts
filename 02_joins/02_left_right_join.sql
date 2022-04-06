/* Выбрать столбцы compane_name, product_name из таблицы supplies. 
Взять полностью вторую колонку и вставить данные исходя из соотношение 
правой таблички supplies и его primary key supplier_id к внешнему ключу у таблицы products -  supplier_id */
SELECT compane_name, product_name
FROM supplies
LEFT JOIN products ON supplies.supplier_id = product.supplier_id

/* Выбрать столбцы company_name, order_id из таблицы customers. 
Взять полностью вторую колонку и вставить данные исходя из соотношение 
правой таблички supplies и его primary key customer_id к внешнему ключу у таблицы orders - customer_id.
Где строки из столбца order_id только пустые */
SELECT company_name, order_id
FROM customers
LEFT JOIN orders ON orders.customer_id = customers.customer_id
WHERE order_id IS NULL

/* Выбрать столбцы last_name, order_id из таблицы employees. 
Взять полностью первую колонку и вставить данные исходя из соотношение 
левой таблички supplies и его primary key employee_id к внешнему ключу у таблицы orders - employee_id.
Где строки из столбца order_id только НЕ пустые */
SELECT last_name, order_id
FROM employees
RIGHT JOIN orders ON orders.employee_id = employees.employee_id
WHERE order_id IS NOT NULL

/* Посчитать количество строк из таблицы employees. 
При этом взять полностью первую колонку и вставить данные исходя из соотношение 
левой таблички employees и его primary key employee_id к внешнему ключу у таблицы orders - employee_id.
Где строки из столбца order_id только пустые */
SELECT COUNT(*)
FROM employees
RIGHT JOIN orders ON orders.employee_id = employees.employee_id
WHERE order_id IS NULL