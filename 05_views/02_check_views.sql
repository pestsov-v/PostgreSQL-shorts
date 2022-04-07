/* Через представление View мы можем модифицировать существующую
таблицу даже в обход условий в фильтрах WHERE. 
Чтобы этого не было, необходимо прописать WITH LOCAL CHECK OPTION */

/* Создание представления View */
CREATE OR REPLACE VIEW heavy_orders AS 
SELECT *
FROM orders
WHERE freight > 100
with LOCAL CHECK OPTION

/* Попытка модификации представления View */
INSERT INTO heavy_orders
VALUES (11900, 'FOLIG' '2000-01-01' ...)
