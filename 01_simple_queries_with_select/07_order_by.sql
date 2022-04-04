/*  */
SELECT DISTINCT country
FROM customers
ORDER BY country ASC

/*  */
SELECT DISTINCT country
FROM customers
ORDER BY country DESC

/*  */
SELECT DISTINCT country,city 
FROM customers
ORDER BY country DESC, city DESC