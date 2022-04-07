CREATE TABLE book 
(
    book_id int,
    title text NOT NULL,
    isbn varchar(32) NOT NULL,
    publisher int,

    CONSTRAINT PK_book_book_id PRIMARY KEY(book_id)
)

/* Добавить в таблицу book столбца price и назвать его 
CHK_book_price с условием, что price не может быть меньше нуля.
Для CHECK можно прописать любые логические операторы */
ALTER TABLE book
ADD COLUMN price decimal CONSTRAINT CHK_book_price CHECK (price >= 0)