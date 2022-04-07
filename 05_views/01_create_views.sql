/* Создать представление с названием products_supplies_categories,
где добавить следующие столбцы product_name, quanity_per_unit, unit_price, units_in_stock, 
при этом данные соединить внутренним соединением по одноименным 
ключам с таблицей suppliers и таблицей categories */
CREATE VIEW products_supplies_categories AS
SELECT product_name, quanity_per_unit, unit_price, units_in_stock
FROM products
JOIN suppliers USING(supplier_id)
JOIN categories USING(category_id)