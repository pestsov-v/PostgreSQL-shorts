/* SELF JOIN используется, когда нужно соединить таблицу 
с собой же, словно это две разные таблицы временно переименовые столбец
словно это другая таблица. 

Выбрать firstName рабочего в одну колонку и firstName руководителя в другую
из таблицы employee с помощью внешнего, левого соединения таким образом, что 
берутся сперва все левые элементы и к ним поднят соответствие правых элементов.
После чего сгрупировать по менеджерам.
 */
SELECT e.firstName || ' ' || e.last_name AS employee
       m.firstName || ' ' || e.last_name AS manager
FROM employee e 
LEFT JOIN employee e ON m.employees = e.manager_id
ORDER BY manager