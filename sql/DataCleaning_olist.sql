--data cleaning

SELECT 
    order_purchase_timestamp,
    order_approved_at
FROM orders
LIMIT 5;

CREATE OR REPLACE VIEW orders_clean AS
SELECT
    order_id,
    customer_id,
    order_status,

    order_purchase_timestamp AS purchase_ts,
    order_approved_at AS approved_ts,
    order_delivered_customer_date AS delivered_ts,
    order_estimated_delivery_date AS estimated_ts
FROM orders;

CREATE OR REPLACE VIEW orders_time_features AS
SELECT
    order_id,
    customer_id,
    order_status,

    purchase_ts,
    YEAR(purchase_ts) AS order_year,
    MONTH(purchase_ts) AS order_month,
    DATE(purchase_ts) AS order_date,
    DAYNAME(purchase_ts) AS order_day,

    delivered_ts,
    estimated_ts
FROM orders_clean;

SELECT * FROM orders_time_features LIMIT 5;

SELECT
    COUNT(*) AS total_orders,
    SUM(delivered_ts IS NULL) AS missing_delivery_date,
    SUM(approved_ts IS NULL) AS missing_approval
FROM orders_clean
WHERE delivered_ts IS NOT NULL;

CREATE OR REPLACE VIEW delivery_metrics AS
SELECT
    order_id,
    purchase_ts,
    delivered_ts,
    estimated_ts,

    DATEDIFF(delivered_ts, estimated_ts) AS delivery_delay_days
FROM orders_clean
WHERE delivered_ts IS NOT NULL
  AND estimated_ts IS NOT NULL;

--payment 

SELECT * FROM payments LIMIT 5;

SELECT
    payment_type,
    COUNT(*) AS cnt
FROM payments
GROUP BY payment_type;

SELECT
    MIN(price) AS min_price,
    MAX(price) AS max_price,
    MIN(freight_value) AS min_freight
FROM order_items;

--creating master

CREATE OR REPLACE VIEW sales_master AS
SELECT
    o.order_id,
    o.customer_id,
    ot.order_date,
    ot.order_month,
    ot.order_year,

    oi.product_id,
    oi.seller_id,
    oi.price,
    oi.freight_value,

    p.product_category_name,
    pay.payment_type,
    pay.payment_value
FROM orders_clean o
JOIN orders_time_features ot ON o.order_id = ot.order_id
JOIN order_items oi ON o.order_id = oi.order_id
LEFT JOIN products p ON oi.product_id = p.product_id
LEFT JOIN payments pay ON o.order_id = pay.order_id
WHERE o.order_status = 'delivered';

