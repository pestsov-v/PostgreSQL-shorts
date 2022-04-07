/* Создать таблицы customer со следующими столбцами 
сustomer_id, full_name, status. При этом статус по умолчанию установлен как r. 
Также поверх значения по умолчанию, наложено ограничения, что статус может быть или r или p */
CREATE TABLE customer
(
    сustomer_id serial,
    full_name text,
    status char DEFAULT 'r'

    CONSTRAINT PK_customer_customer_id PRIMARY KEY(customer_id)
    CONSTRAINT CHK_customer_status CHECK (status = 'r' OR status 'p')
)

