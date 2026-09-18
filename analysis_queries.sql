-- E-commerce Analytics SQL Portfolio Project
-- MySQL 8+

-- 1. Overall business KPIs
SELECT
    COUNT(DISTINCT o.order_id) AS delivered_orders,
    ROUND(SUM(oi.quantity * oi.selling_price), 2) AS revenue,
    ROUND(SUM(oi.quantity * (oi.selling_price - oi.unit_cost)), 2) AS profit,
    ROUND(
        SUM(oi.quantity * oi.selling_price) / COUNT(DISTINCT o.order_id),
        2
    ) AS avg_order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered';

-- 2. Monthly revenue trend
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    ROUND(SUM(oi.quantity * oi.selling_price), 2) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY month;

-- 3. Revenue and profit by category
SELECT
    p.category,
    ROUND(SUM(oi.quantity * oi.selling_price), 2) AS revenue,
    ROUND(SUM(oi.quantity * (oi.selling_price - oi.unit_cost)), 2) AS profit
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category
ORDER BY revenue DESC;

-- 4. Top 10 customers by revenue
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    ROUND(SUM(oi.quantity * oi.selling_price), 2) AS revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id, c.customer_name, c.city
ORDER BY revenue DESC
LIMIT 10;

-- 5. Revenue by city
SELECT
    c.city,
    ROUND(SUM(oi.quantity * oi.selling_price), 2) AS revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY c.city
ORDER BY revenue DESC;

-- 6. Order-status distribution
SELECT
    order_status,
    COUNT(*) AS orders,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM orders),
        2
    ) AS pct_of_orders
FROM orders
GROUP BY order_status
ORDER BY orders DESC;

-- 7. Repeat vs one-time customers using a CTE
WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(*) AS delivered_orders
    FROM orders
    WHERE order_status = 'Delivered'
    GROUP BY customer_id
)
SELECT
    CASE
        WHEN delivered_orders >= 2 THEN 'Repeat Customer'
        ELSE 'One-time Customer'
    END AS customer_type,
    COUNT(*) AS customers
FROM customer_orders
GROUP BY
    CASE
        WHEN delivered_orders >= 2 THEN 'Repeat Customer'
        ELSE 'One-time Customer'
    END;

-- 8. Customer order frequency
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(DISTINCT CASE
        WHEN o.order_status = 'Delivered' THEN o.order_id
    END) AS delivered_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY delivered_orders DESC;

-- 9. Rank products within each category using a window function
WITH product_sales AS (
    SELECT
        p.category,
        p.product_name,
        SUM(oi.quantity * oi.selling_price) AS revenue
    FROM products p
    JOIN order_items oi ON p.product_id = oi.product_id
    JOIN orders o ON oi.order_id = o.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY p.category, p.product_name
)
SELECT
    category,
    product_name,
    ROUND(revenue, 2) AS revenue,
    DENSE_RANK() OVER (
        PARTITION BY category
        ORDER BY revenue DESC
    ) AS revenue_rank
FROM product_sales
ORDER BY category, revenue_rank;

-- 10. Monthly running revenue
WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS month,
        SUM(oi.quantity * oi.selling_price) AS revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
)
SELECT
    month,
    ROUND(revenue, 2) AS monthly_revenue,
    ROUND(
        SUM(revenue) OVER (ORDER BY month),
        2
    ) AS running_revenue
FROM monthly_sales
ORDER BY month;

-- 11. Products generating above-average revenue
WITH product_revenue AS (
    SELECT
        p.product_id,
        p.product_name,
        SUM(oi.quantity * oi.selling_price) AS revenue
    FROM products p
    JOIN order_items oi ON p.product_id = oi.product_id
    JOIN orders o ON oi.order_id = o.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY p.product_id, p.product_name
)
SELECT *
FROM product_revenue
WHERE revenue > (SELECT AVG(revenue) FROM product_revenue)
ORDER BY revenue DESC;

-- 12. Payment-method performance
SELECT
    o.payment_method,
    COUNT(DISTINCT o.order_id) AS delivered_orders,
    ROUND(SUM(oi.quantity * oi.selling_price), 2) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY o.payment_method
ORDER BY revenue DESC;
