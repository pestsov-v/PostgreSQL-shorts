/* Выбрать все уникальные заказы, которых вес от 20 до 40 */
SELECT *
FROM orders
WHERE freight >= 20 AND freight <= 40

/* Тоже самое, что и выражение выше. Выбрать все уникальные заказы, которых вес от 20 до 40 */
SELECT COUNT(*)
FROM orders
WHERE freight BETWEEN 20 AND 40

/* Выбрать все заказы, которые были сделаны между 1998-03-30 и 1998-04-03 включительно */
SELECT *
FROM orders
WHERE orders_date BETWEEN '1998-03-30' AND '1998-04-03'