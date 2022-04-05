# Выжимка по работе с PosgreSQL

Попалась мне книжка по PostgreSQL и насчитывала она 1100 страниц, поэтому было принято решение сделать выжимку по самым необходимым элементам. Ясное дело, что есть документация, но порой по избитым вопросам сделав выписку в одном месте быстро находишь то, что нужно не вынуждая себя гуглить запрос.

## Оглавление
- [Выжимка по работе с PosgreSQL](#выжимка-по-работе-с-posgresql)
  - [Оглавление](#оглавление)
  - [Основные типы данных](#основные-типы-данных)
  - [Операторы условий и предикты](#операторы-условий-и-предикты)
  - [Простые запросы SELECT](#простые-запросы-select)
    - [Подробно о фильтре LIKE](#подробно-о-фильтре-like)
  - [Cоединения JOIN](#cоединения-join)
    - [INNER JOIN](#inner-join)
    - [RIGHT OUTHER JOIN](#right-outher-join)
    - [LEFT OUTHER JOIN](#left-outher-join)
    - [FULL OUTHER JOIN](#full-outher-join)
    - [CROSS JOIN](#cross-join)

## Основные типы данных

| Тип данных | Название | Байты | Описание | Размерность |
| :--------: | :------: | :---: | :------- | :---------- |
| Целые числа | smallserial | 2 | Автоувеличение. Малые числа | 1 - 32.367 |
| Целые числа | serial | 4 | Автоувеличение. Средние числа | 1 - 2.147.483.648 |
| Целые числа | bigserial | 8 | Автоувеличение. Большие числа | 1 - 9.223.372.036.854.775.807 |
| Целые числа | smallint | 2 | Малые числа | 2^16 -> -32.768 - 32.767 |
| Целые числа | integer | 4 | Средние числа | 2^32 -> -2.147.483.648 - 2.147.483.647 |
| Целые числа | bigint | 8 | Большие числа | 2^64 -> -9.223.372.036.854.775.808 - 9.223.372.036.854.775.807 |
| Реальные числа | decimal / numeric | Переменная | Указанная пользователем точность | -3.4 * 10^38 - +3.4 * 10^38 |
| Реальные числа | real / float | 4 | Указанная пользователем точность | 6 цифр после запятой | 
| Реальные числа | double precision / float8 / float | 8 | Указанная пользователем точность | 15 цифр после запятой |
| Cимволы | char | Переменная | Фиксированя длина символьной длины | Фиксирует пространство под определенное количество символов |
| Cимволы | varchar | Переменная | Фиксированя длина символьной длины | Фиксирует пространство исходя из количества символов |
| Cимволы | text | Переменная | Произвольная длина символьной длины | Фиксирует пространство исходя из количества символов |
| Логический | boolean / bool | 1 | Используется логика | True / False |
| Время | date | 4 | Хранит только дату | 4713 В.С. -> 294.276 AD |
| Время | time | 8 | Хранит только дату | 00:00:00 -> 24:00:00 |
| Время | timestamp | 8 | Хранит дату и время | 4713 В.С. -> 294.276 AD |
| Время | interval | 16 | Cохраняет разницу между двумя временными промежутками | -178.000.000 -> + 178.000.000 |
| Время | timestamptz | 8 | Cохраняет временной промежуток и временную зону | 4713 В.С. -> 294.276 AD + tz |

Также другими типами, которые часто используются и могут быть использованы в PosgreSQL являются:
- Arrays (Массивы)
- JSON (JavaScript ориентированный объект)
- XML
- NULL - отсутствие данных

## Операторы условий и предикты
PosrgreSQL поддерживает следующие операторы условий:
| Оператор условий | Описание |
| :--------------: | :------- |
| < | строго меньше |
| > | строго больше |
| <= | меньше или равно |
| >= | больше или равно |
| = | равно |
| <> или != | не равно |

PostgreSQL поддерживает следующие предикты: 
| Оператор условий | Описание |
| :--------------: | :------- |
| IS NULL | cодержание значений NULL. Уточнение: NULL это неопределённость, а не значение NULL как в JS |
| IS NOT NULL | отсутствует ли значение NULL |
| IS TRUE | cодержание значений TRUE |
| IS NOT TRUE | отсутствует ли значение TRUE |
| IS FALSE | cодержание значений FALSE |
| IS NOT FALSE | отсутствует ли значение FALSE |
| IS UNKNOWN | cодержание значений NULL |
| IS NOT UNKNOWN | отсутствует ли значение UNKNOWN |

## Простые запросы SELECT
SELECT запросы это основа РostgreSQL в случае фильтрации и создании результирующих наборов из базы данных. В SELECT активно используются операторы условий для дополнительной филтрации необходимых строк. 

| Параметр | Пояснение | Синтаксис | Порядок следования | Примеры | 
| :------: | :-------- | :-------- | :----------------- | :--------------- |
| SELECT | Выбирает необходимые колонки | SELECT <column_name> | Первым в каждом запросе | - | 
| FROM | Указывается таблица из которой выбирать данные | FROM <table_name> | После SELECT | - |
| DISTINCT | Убирает повторяющиеся строки | SELECT DISTINCT (<colemn_name>) | После SELECT | [01_distinct.sql](01_simple_queries_with_select/01_distinct.sql) |
| COUNT | Возвращает количество строк | SELECT COUNT (<colemn_name>) | После SELECT | [02_count.sql](01_simple_queries_with_select/02_count.sql) |
| WHERE | Возвращает строки, которые проходят условие указанное в WHERE | SELECT <column_name> <br/> FROM <table_name> <br/> WHERE <condition_name> | После FROM | [03_where.sql](01_simple_queries_with_select/03_where.sql) |
| AND | Создаёт несколько условий в WHERE, чтобы в результирующий набор попали значения проходящие несколько условий | SELECT <column_name> <br/> FROM <table_name> <br/> WHERE <condition_name_1> AND <condition_name_n> | После WHERE | [04_and_ur.sql](01_simple_queries_with_select/04_and_or.sql) |
| OR| Создаёт несколько условий в WHERE, чтобы в результирующий набор попали значения проходящие под одно из условий | SELECT <column_name> <br/> FROM <table_name> <br/> WHERE <condition_name_1> OR <condition_name_n> | После WHERE | [04_and_ur.sql](01_simple_queries_with_select/04_and_or.sql) |
| BETWEEN | Создаёт диапазон которые отфильтровывает результирующий набор. Включает границы. Подобный фильтр может быть создан и с помощью AND | SELECT <column_name> <br/> FROM <table_name> <br/> WHERE <column_name> BETWEEN <condition_name_1> AND <condition_name_2> | После WHERE | [05_between.sql](01_simple_queries_with_select/05_between.sql) |
| IN | Является более удобным аналогом OR в случае, когда условий много. Подобный фильтр может быть создан и с помощью OR | WHERE <column_name> IN (<condition_name_1>, <condition_name_2>, <condition_name_n> | После WHERE | [06_in_not_in.sql](01_simple_queries_with_select/06_in_not_in.sql) |
| NOT IN | В результирующий набор попадают все строки, которые не подпадают под фильтр. Является противоположностью IN | WHERE <column_name> NOT IN (<condition_name_1>, <condition_name_2>, <condition_name_n> | После WHERE | [06_in_not_in.sql](01_simple_queries_with_select/06_in_not_in.sql) |
| ORDER BY | Сортирует результирующий набор по убыванию или по возрастанию. По умолчанию сортирует по возрастанию | SELECT <column_name> FROM <table_name> ORDER BY <column_name> | Когда необходимо результирующий набор соответствующе отсортировать. Может быть как перед LIMIT так и после определенного WHERE | [07_order_by.sql](01_simple_queries_with_select/07_order_by.sql) |
| MIN | Находит минимальное или самую раннюю строку исходя из условия запроса | SELECT MIN (<column_name>) | После SELECT | [08_min_max_avg.sql](01_simple_queries_with_select/08_min_max_avg.sql) |
| MAX | Находит максимальное или самую позднюю строку исходя из условия запроса | SELECT MAX (<column_name>) | После SELECT | [08_min_max_avg.sql](01_simple_queries_with_select/08_min_max_avg.sql) |
| AVG | Находит среднее значение строки исходя из условия запроса | SELECT AVG (<column_name>) | После SELECT | [08_min_max_avg.sql](01_simple_queries_with_select/08_min_max_avg.sql) |
| LIKE | Лёгкая версия регулярных выражений. После LIKE задаётся шаблон, который служит фильтров | SELECT <column_name> <br/> FROM <table_name> <br/> WHERE <column_name> <br/> LIKE <like_string> | После WHERE | [09_like.sql](01_simple_queries_with_select/09_like.sql) |
| LIMIT | Ограничивает количество строк в результирующем наборе | SELECT <column_name> <br/> FROM <table_name> <br/> LIMIT <limit_number> | Вконце запроса | [10_limit.sql](01_simple_queries_with_select/10_limit.sql) |
| IS NULL | Выбираются пустые строки, которые находятся в указанном столбце в условии поиска | SELECT <column_name> <br/> FROM <table_name>  <br/> WHERE <column_name> IS NULL | После WHERE на необходимый столбец | [11_check_on_null.sql](01_simple_queries_with_select/11_check_on_null.sql) |
| IS NOT NULL | Выбираются все не пустые строки, которые находятся в указанном столбце в условии поиска | SELECT <column_name> <br/> FROM <table_name>  <br/> WHERE <column_name> IS NOT NULL | После WHERE на необходимый столбец | [11_check_on_null.sql](01_simple_queries_with_select/11_check_on_null.sql) |
| GROUP BY | Группирует данные по значениям из указанного столбца | SELECT <column_name>, SUM(<column_name>) <br/>  FROM <table_name> <br/>  GROUP BY <column_name> <br/>  ORDER BY SUM(<column_name>) DESC | В месте, где необходима группировка | [12_group_by](01_simple_queries_with_select/12_group_by.sql) |
| HAVING | Вторичный фильтр, когда WHERE - первичный фильтр. Используется, когда нужно допольнительно отфилтровать результат после работы WHERE | SELECT <column_name> (<column_name> * <column_name>) FROM <table_name> WHERE <condition_name>  GROUP BY <column_name> HAVING SUM(<column_name> * <column_name>)  <condition_name> | [13_having.sql](01_simple_queries_with_select/13_having.sql) |
| UNION | Объеденяет уникальные строки из общих столбцов разных таблиц | SELECT <column_name> <br/> FROM <table_name_1> UNION SELECT <column_name> <br/> FROM <table_name_2> | Между двумя запросами | [14_union_intersect_except.sql](01_simple_queries_with_select/14_union_intersect_except.sql) |
| UNION ALL | Объеденяет абсолютно все строки из общих столбцов разных таблиц | SELECT <column_name> <br/> FROM <table_name_1> UNION ALL SELECT <column_name> <br/> FROM <table_name_2> | Между двумя запросами | [14_union_intersect_except.sql](01_simple_queries_with_select/14_union_intersect_except.sql) |
| INTERSECT | Выводит пересекающиеся уникальные строки из общих столбцов разных таблиц | SELECT <column_name> <br/> FROM <table_name_1> INTERSECT SELECT <column_name> <br/> FROM <table_name_2> | Между двумя запросами | [14_union_intersect_except.sql](01_simple_queries_with_select/14_union_intersect_except.sql) |
| INTERSECT ALL | Выводит пересекающиеся абсолютно все строки из общих столбцов разных таблиц | SELECT <column_name> <br/> FROM <table_name_1> INTERSECT ALL SELECT <column_name> <br/> FROM <table_name_2> | Между двумя запросами | [14_union_intersect_except.sql](01_simple_queries_with_select/14_union_intersect_except.sql) |
| EXCEPT | Выводит не пересекающиеся уникальные строки из общих столбцов разных таблиц | SELECT <column_name> <br/> FROM <table_name_1> EXCEPT SELECT <column_name> <br/> FROM <table_name_2> | Между двумя запросами | [14_union_intersect_except.sql](01_simple_queries_with_select/14_union_intersect_except.sql) |
| EXCEPT ALL | Выводит не пересекающиеся абсолютно все строки из общих столбцов разных таблиц | SELECT <column_name> <br/> FROM <table_name_1> EXCEPT ALL SELECT <column_name> <br/> FROM <table_name_2> | Между двумя запросами | [14_union_intersect_except.sql](01_simple_queries_with_select/14_union_intersect_except.sql) |


### Подробно о фильтре LIKE
Фильтр LIKE используется для того, чтобы искать строки похожие на заданный шаблон. <br/>
**Плейсхордеры:** <br/>
- `%` - означающий 0, 1 или более символов. <br/>
- `_` (нижнее подчеркивание) означает ровно 1 любой символ. <br/> <br/>

**Использование:** <br/>
- LIKE `U%` - все выражение начинающиеся с U. 
- LIKE `%a` - все выражение заканчивающееся на а.
- LIKE `%гусь%` - все строки, где есть словарный набор - гусь. 
- LIKE `J%n` - все строки, которые начинаются на J и кончаются на n. 
- LIKE `_oh_` - все строки имеющие ровно один символ до и ровно один символ после oh. 
- LIKE `_oh%` - все строки где ровно один символ находится перед oh и произвольное количество символов после oh.
  
## Cоединения JOIN 

В PostgreSQL существуют следующие типы JOIN'ов:
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN 
- LEFT OUTHER JOIN
- FULL OUTHER JOIN 
- CROSS JOIN

При создании соединений правой табличкой считается **первая** табличка, а **вторая** табличка - левой.

### INNER JOIN
Внутреннее соединение. <br/> 
При проведение такого соединения из второй (левой) таблички в первую (правую) табличку попадут только те строки, внешних ID ключ которых соответствует второй (левой) табличке.

Пример реализации: <br/> 

[![msg297304287-433128.jpg](https://i.postimg.cc/MTVPWMyR/msg297304287-433128.jpg)](https://postimg.cc/0M5dnNX2)

Примеры кода: [01_inner_join.sql](02_joins/01_inner_join.sql)

### RIGHT OUTHER JOIN
Внешнее правое соединение. <br/>
При проведении правого внешнее соединение из первой (правой) таблицы попадают абсолютно все выбранные записи, а если к этим записям из второй (левой) таблички есть соответствия, то они подтягиваются, если нет, тогда результатом будет NULL.

Пример реализации: <br/> 

[![msg297304287-433129.jpg](https://i.postimg.cc/xdkp4F86/msg297304287-433129.jpg)](https://postimg.cc/KK25KfnT)

Примеры кода: [02_left_right_join](02_joins/02_left_right_join.sql)

### LEFT OUTHER JOIN

Внешнее левое соединение. <br/>
При проведении левое внешнее соединение из второй (левой) таблицы попадают абсолютно все выбранные записи, а если к этим записям из первой (правой) таблички есть соответствия, то они подтягиваются, если нет, тогда результатом будет NULL.

Пример реализации: <br/> 

[![msg297304287-433130.jpg](https://i.postimg.cc/rFXTCxn6/msg297304287-433130.jpg)](https://postimg.cc/CdN9wBpJ)

Примеры кода: [02_left_right_join](02_joins/02_left_right_join.sql)

### FULL OUTHER JOIN
Полное внешнее соединение. <br/>
При проведении полного внешнего соединения, забираются полностью все выбранные данные из обоих таблиц, если есть соответствия по ключам между табличками, то они подтягиваются, если их нет, тогда результатом будет NULL

Пример реализации: <br/> 

[![msg297304287-433131.jpg](https://i.postimg.cc/wvnprm9m/msg297304287-433131.jpg)](https://postimg.cc/9RPKRzRm)

### CROSS JOIN
Декартовое произведение. <br/>
При проведении декартового произведения, сопоставляются все записи из одной таблички к другой. Таким образом к каждом записи будет соответствующий перебор всех записей из другой таблички. Если есть общие данные из табличек, они подтягиваются, если их нет, тогда результатом будет NULL.

Пример реализации: <br/> 

[![msg297304287-433132.jpg](https://i.postimg.cc/8zLV05YF/msg297304287-433132.jpg)](https://postimg.cc/18RTg9sP)


