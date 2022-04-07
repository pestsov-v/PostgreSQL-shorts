/* ANY Чтобы любой custom_id совпадал с любым custom_id этой выборки */
SELECT DISTINCT company_name
FROM customers
WHERE customer_id ANY (
    SELECT customer_id
    FROM orders
    JOIN order_details USING (order_id)
    WHERE quantity > 40
)

/* ALL Чтобы больше всех этих значений, что попали в выборку */
SELECT DISTINCT product_name, quantity
FROM products
JOIN order_details USING(product_id)
WHERE quantity > ALL (
    SELECT AVG(quantity)
    FROM order_details
    GROUP BY product_id)
ORDER BY quantity