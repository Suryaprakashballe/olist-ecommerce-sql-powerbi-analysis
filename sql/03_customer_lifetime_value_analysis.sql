/*
====================================================
Customer Lifetime Value & Retention Analysis
====================================================
This file focuses on advanced customer analytics:
- One-time vs repeat customers
- Revenue contribution by customer type
- Customer Lifetime Value (CLV)
- Order frequency distribution
====================================================
*/

-- Customer Segmentation: One-time vs Repeat Customers
SELECT
    CASE 
        WHEN order_count = 1 THEN 'One-time Customer'
        ELSE 'Repeat Customer'
    END AS customer_type,
    COUNT(*) AS total_customers
FROM (
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS order_count
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
    WHERE o.order_status = 'delivered'
    GROUP BY c.customer_unique_id
) t
GROUP BY customer_type;


-- Revenue Contribution by Customer Type
SELECT
    customer_type,
    ROUND(SUM(payment_value), 2) AS total_revenue
FROM (
    SELECT
        c.customer_unique_id,
        p.payment_value,
        CASE 
            WHEN COUNT(DISTINCT o.order_id) > 1 THEN 'Repeat Customer'
            ELSE 'One-time Customer'
        END AS customer_type
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
    JOIN payments p
        ON o.order_id = p.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY c.customer_unique_id, p.payment_value
) t
GROUP BY customer_type;


-- Top 10 Customers by Lifetime Value
SELECT
    c.customer_unique_id,
    ROUND(SUM(p.payment_value), 2) AS customer_lifetime_value
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN payments p
    ON o.order_id = p.order_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_unique_id
ORDER BY customer_lifetime_value DESC
LIMIT 10;


-- Average Customer Lifetime Value by Customer Type
SELECT
    customer_type,
    ROUND(AVG(customer_lifetime_value), 2) AS avg_clv
FROM (
    SELECT
        c.customer_unique_id,
        SUM(p.payment_value) AS customer_lifetime_value,
        CASE
            WHEN COUNT(DISTINCT o.order_id) > 1 THEN 'Repeat Customer'
            ELSE 'One-time Customer'
        END AS customer_type
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
    JOIN payments p
        ON o.order_id = p.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY c.customer_unique_id
) t
GROUP BY customer_type;


-- Order Frequency Distribution (Customer Purchase Behavior)
SELECT
    order_count,
    COUNT(*) AS total_customers
FROM (
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS order_count
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
    WHERE o.order_status = 'delivered'
    GROUP BY c.customer_unique_id
) t
GROUP BY order_count
ORDER BY order_count;
