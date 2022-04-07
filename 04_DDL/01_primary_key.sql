/* chair_id это первичный ключ:
- PRIMARY KEY говорит, что это уникальная запись и не может быть ещё одного столбца с PRIMARY KEY
- Мы не можем вставлять NULL в столбец с PRIMARY KEY
- serial делает автоинкремент
- проблема в том, что мы можем вручную вставить ID в PRIMARY KEY */
CREATE TABLE chair 
(
    chair_id serial PRIMARY KEY,
    chair_name varchar,
    dean varchar
)

/* Тоже самое что пример с PRIMARY KEY, но есть отличие:
- UNIQUE только делает уникальным этот столбец, но не запрещает создавать ещё столбцы с UNIQUE NOT NULL
PRIMARY KEY говорит о том, что данный столбец уникальный во всей таблице */
CREATE TABLE chair 
(
    chair_id serial UNIQUE NOT NULL,
    chair_name varchar,
    dean varchar
)


/* Выведет название по умолчанию именует ограничения chair_chair_id_key.
Мы можем отдельно назвать ограничения с помощью выражения CONSTRAINT вконце поля запроса */
SELECT constraint_name 
FROM information_schema.key_column_usage
WHELE table_name = 'chair'
    AND tanle_schema = 'public'
    AND column_name = 'chair_id'

/* Вручную введение ограничения таблицы */
CREATE TABLE chair 
(
    chair_id serial,
    chair_name varchar,
    dean varchar,

    CONSTRAINT PK_chair_ckair_id PRIMARY KEY(chair_id)
)