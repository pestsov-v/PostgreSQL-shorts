/* Выбрать из столбцов product_name и unit_price данные из таблицы товаров products. 
Ограничится 10 первыми строками, которые подпадают под фильтры */
SELECT product_name, unit_price
FROM products
LIMIT 10

/* Выбрать из столбцов product_name и unit_price данные из таблицы товаров products, те товары, которые не распродаются. 
Отсортировать результирующий набор по убыванию. 
Ограничится 10 первыми строками, которые подпадают под фильтры */
SELECT product_name, unit_price
FROM products
WHERE discontinued <> 1
ORDER_BY unit_price DESC
LIMIT 10