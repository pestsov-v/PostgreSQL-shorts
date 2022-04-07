/* Обновить существующую строку в таблице full_name, 
а именно только значения в столбцах full_name на значение 'Elias' 
и столбец rating на 5, по его ID  */
UPDATE author
SET full_name = 'Elias', rating = 5
WHERE author_id = 1

/* Удаление всех строк, где rating ниже 4.5 */
DELETE FROM author
WHERE rating < 4.5

/* Если мы хотим удалить абсолютно все строки */
DELETE FROM author

/* Тоже что и запись выше, только дополнительно PostgreSQL не пишет логи */
TRUNCATE TABLE author

/* Позволяет вернуть сразу данные после создания запроса или его обновления */
INSERT INTO (title, isbn, publisher_id)
VALUES('title', 'isbn' 1)
RETURNING *

/* Позволяет вернуть сразу же только созданный ID */
INSERT INTO (title, isbn, publisher_id)
VALUES('title', 'isbn' 1)
RETURNING publisher_id

