/* Выбрать всех продавцов, которые проживают в Mexico, Germany, USA, Canada */
SELECT * 
FROM customers
WHERE country = 'Mexico' OR country = 'Germany' OR country = 'USA' OR country = 'Canada'


/* Тоже самое, что и выражение выше. Выбрать всех продавцов, которые проживают в Mexico, Germany, USA, Canada */
SELECT * 
FROM customers
WHERE country IN( 'Mexico', 'Germany', 'USA', 'Canada', 'Mexico')

/* Выбрать все товары у которых ID состоит 1, 3, 5, 7 */
SELECT * 
FROM products
WHERE categoty_id IN (1, 3, 5, 7)