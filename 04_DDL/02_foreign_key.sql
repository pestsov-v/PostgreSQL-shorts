/* Таблица, с которой будет происходить связывание */
CREATE TABLE chair 
(
    publisher_id int,
    publisher_name vachar(128), NOT NULL
    address text

    
    CONSTRAINT PK_publisher_publisher_id PRIMARY KEY(publisher_id) 
)

/* Добавление внешнего ключа FOREIGN KEY в новосозданную табличку book */
CREATE TABLE book 
(
    book_id int,
    title text NOT NULL,
    isbn varchar(32) NOT NULL,
    publisher_id int

    CONSTRAINT PK_book_book_id PRIMARY KEY (book_id)
    CONSTRAINT FK_books_publisher FOREIGN KEY(publisher_id) REFERENCES publisher(publisher_id)
)

/* Добавление внешнего ключа FOREIGN KEY в уже существующую табличку book */
ALTER TABLE book
ADD CONSTRAINT FK_books_publisher FOREIGN KEY(publisher_id) REFERENCES publisher(publisher_id)