   show databases;
   SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS order_count,
    SUM(o.order_total) AS total_spent
FROM 
    customer c
JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, c.customer_name
ORDER BY 
    total_spent DESC
LIMIT 10;





SELECT SUM(order_total) AS total_revenue
FROM orders;

SELECT customer_id, customer_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING SUM(order_total) > (
        SELECT AVG(order_total)
        FROM orders
    )
);





CREATE VIEW high_value_customerss AS
SELECT o.customer_id, SUM(oi.unit_price * oi.quantity) AS total_spent
FROM order_item oi
JOIN orders o ON oi.order_id = o.id
GROUP BY o.customer_id
HAVING total_spent > 1;




SELECT
    customer.customer_name,
    customer.customer_id,
    orders.order_id
FROM
    customer
JOIN
    orders ON customer.customer_id= orders.customer_id;





SELECT * FROM products
WHERE price > (SELECT AVG(price) FROM products);


SELECT category, COUNT(*) as total_items, AVG(price) as avg_price
FROM products
GROUP BY category;