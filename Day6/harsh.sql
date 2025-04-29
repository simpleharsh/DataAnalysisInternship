ALTER TABLE orders
MODIFY COLUMN order_date DATE; 


SELECT
    EXTRACT(YEAR FROM order_date) AS sales_year,
    EXTRACT(MONTH FROM order_date) AS sales_month,
    SUM(total_amount) AS monthly_revenue
FROM
    orders
GROUP BY
    sales_year, sales_month
ORDER BY
    sales_year, sales_month;
    

SELECT
    EXTRACT(YEAR FROM order_date) AS sales_year,
    EXTRACT(MONTH FROM order_date) AS sales_month,
    COUNT(DISTINCT order_id) AS monthly_order_volume
FROM
    orders
GROUP BY
    sales_year, sales_month
ORDER BY
    sales_year, sales_month;
    
    
    
    
SELECT
    EXTRACT(MONTH FROM order_date) AS sales_month,
    SUM(total_amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS monthly_order_volume
FROM
    orders
WHERE
    EXTRACT(YEAR FROM order_date) = 2023
GROUP BY
    sales_month
ORDER BY
    sales_month;    
    
    
    
    
SELECT
    SUM(total_amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS monthly_order_volume
FROM
    orders
WHERE
    EXTRACT(YEAR FROM order_date) = 2023
    AND EXTRACT(MONTH FROM order_date) = 4;



SELECT
    EXTRACT(YEAR FROM order_date) AS sales_year,
    SUM(total_amount) AS yearly_revenue
FROM
    orders
GROUP BY
    sales_year
ORDER BY
    sales_year;
    
    
    
 SELECT
    EXTRACT(YEAR FROM order_date) AS sales_year,
    EXTRACT(MONTH FROM order_date) AS sales_month,
    SUM(total_amount) AS monthly_revenue
FROM
    orders
GROUP BY
    sales_year, sales_month
ORDER BY
    monthly_revenue DESC
LIMIT 3;   