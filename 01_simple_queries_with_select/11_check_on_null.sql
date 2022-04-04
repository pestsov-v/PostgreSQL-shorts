/* Выбрать столбцы ship_city, ship_region, ship_country из таблицы заказчиков, где поле ship_region пусто */
SELECT ship_city, ship_region, ship_country
FROM orders
WHERE ship_region IS NULL

/* Выбрать столбцы ship_city, ship_region, ship_country из таблицы заказчиков, где поле ship_region НЕ пусто */
SELECT ship_city, ship_region, ship_country
FROM orders
WHERE ship_region IS NOT NULL
