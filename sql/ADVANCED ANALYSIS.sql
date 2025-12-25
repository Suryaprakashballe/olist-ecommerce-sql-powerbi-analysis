--advanced analysis


SELECT
    CASE 
        WHEN order_count = 1 THEN 'One-time Customer'
        ELSE 'Repeat Customer'
    END AS customer_type,
    COUNT(*) AS customers
FROM (
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS order_count
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
    GROUP BY c.customer_unique_id
) t
GROUP BY customer_type;


SELECT
    customer_type,
    ROUND(SUM(payment_value), 2) AS revenue
FROM (
    SELECT
        c.customer_unique_id,
        p.payment_value,
        CASE 
            WHEN cnt > 1 THEN 'Repeat Customer'
            ELSE 'One-time Customer'
        END AS customer_type
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
    JOIN payments p
        ON o.order_id = p.order_id
    JOIN (
        SELECT
            c.customer_unique_id,
            COUNT(DISTINCT o.order_id) AS cnt
        FROM orders o
        JOIN customers c
            ON o.customer_id = c.customer_id
        WHERE o.order_status = 'delivered'
        GROUP BY c.customer_unique_id
    ) t
        ON c.customer_unique_id = t.customer_unique_id
    WHERE o.order_status = 'delivered'
) x
GROUP BY customer_type;


SELECT
    c.customer_unique_id,
    ROUND(SUM(p.payment_value), 2) AS lifetime_value
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN payments p
    ON o.order_id = p.order_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_unique_id
ORDER BY lifetime_value DESC
LIMIT 10;


SELECT
    customer_type,
    ROUND(AVG(lifetime_value), 2) AS avg_clv
FROM (
    SELECT
        c.customer_unique_id,
        SUM(p.payment_value) AS lifetime_value,
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


SELECT
    order_count,
    COUNT(*) AS customers
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


