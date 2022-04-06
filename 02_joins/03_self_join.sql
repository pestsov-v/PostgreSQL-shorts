/*  */
SELECT e.firstName || ' ' || e.last_name AS employee
       m.firstName || ' ' || e.last_name AS manager
FROM employee e 
LEFT JOIN employee e ON m.employees = e.manager_id
ORDER BY manager