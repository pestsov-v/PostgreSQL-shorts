CREATE TABLE book 
(
    book_id int NOT NULL,
    title text NOT NULL,
    isbn varchar(32) NOT NULL,
    publisher_id int NOT NULL

    CONSTRAINT PK_book_book_id PRIMARY KEY(book_id)
)

/* int + следующая запись тоже самое что и serial */
/* Создать последовательность с названием book_book_id_seq,
которая начинается с 1 и назначить его в табличке book на столбец book_id */
CREATE SEQUENCE book_book_id_seq
START WITH 1 OWNED BY book.book_id

/* Но этого мало и для того, чтобы столбец 
автоинкрементировался необходимо прописать следующий код */
ALTER TABLE book
ALTER COLUMN book_id SET DEFAULT nextval('book_book_id_seq')

/* Проблема serial в том, что мы можем при добавлении новой 
строки вставить своё значение, которое может перечить с последовательностью, 
поэтому можно создать поле с автоинкрементом, но без возможности вот такого вот влезания в столбец */
CREATE TABLE book 
(
    book_id int GENERATED ALWAYS AS IDENTITY NOT NULL,
    title text NOT NULL,
    isbn varchar(32) NOT NULL,
    publisher_id int NOT NULL

    CONSTRAINT PK_book_book_id PRIMARY KEY(book_id)
)

CREATE SEQUENCE book_book_id_seq
START WITH 1 OWNED BY book.book_id

ALTER TABLE book
ALTER COLUMN book_id SET DEFAULT nextval('book_book_id_seq')

/* При этом мы всё равно можем обойти автоинкремент, но это уже будет
 явно внедрение в последовательность определённого кода */
INSERT INTO book
OVERRINDING SYSTEM VALUE
VALUES(3, 'title3', 'isbn3', 1)


/* Добавление некоторых опций */
CREATE TABLE book 
(
    book_id int GENERATED ALWAYS AS IDENTITY(START WITH 10 INCREMENT BY 2) NOT NULL,
    title text NOT NULL,
    isbn varchar(32) NOT NULL,
    publisher_id int NOT NULL

    CONSTRAINT PK_book_book_id PRIMARY KEY(book_id)
)