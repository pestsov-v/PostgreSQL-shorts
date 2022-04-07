/* Добавление одной строки в таблицу */
INSERT INTO author
VALUES(10, 'John Silver', 4.5)

/* Добавление нескольких значений в несколько столбцов определенной 
таблицы (данные в остальных табличках будут или автоинкрементироватся или NULL) */
INSERT INTO author (author_id, full_name)
VALUES 
(12, 'Name1') 
(13, 'Name2')
(14, 'Name3')

/* Добавление данных сразу из существующей таблички в новую табличку. */
SELECT * 
INTO best_authors
FROM author
WHERE rating >= 4.5