/*
====================================================
Data Preparation & Modeling – Olist E-Commerce
====================================================
This file prepares raw transactional data for analysis by:
- Cleaning date fields
- Creating time-based features
- Handling missing values
- Building a master analytical view
====================================================
*/

----------------------------------------------------
-- 1. Orders: Date Cleaning & Standardization
----------------------------------------------------

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


----------------------------------------------------
-- 2. Time-Based Feature Engineering
----------------------------------------------------

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


----------------------------------------------------
-- 3. Data Quality Checks
----------------------------------------------------

-- Missing date values check
SELECT
    COUNT(*) AS total_orders,
    SUM(delivered_ts IS NULL) AS missing_delivery_date,
    SUM(approved_ts IS NULL) AS missing_approval_date
FROM orders_clean;


----------------------------------------------------
-- 4. Delivery Performance Metrics
----------------------------------------------------

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


----------------------------------------------------
-- 5. Payment Data Overview
----------------------------------------------------

SELECT
    payment_type,
    COUNT(*) AS transaction_count
FROM payments
GROUP BY payment_type;


----------------------------------------------------
-- 6. Product Price & Freight Validation
----------------------------------------------------

SELECT
    MIN(price) AS min_product_price,
    MAX(price) AS max_product_price,
    MIN(freight_value) AS min_freight_value
FROM order_items;


----------------------------------------------------
-- 7. Master Analytical View
----------------------------------------------------

CREATE OR REPLACE VIEW sales_master AS
SELECT
    o.order_id,
    o.customer_id,

    ot.order_date,
    ot.order_month,
    ot.order_year,
    ot.order_day,

    oi.product_id,
    oi.seller_id,
    oi.price,
    oi.freight_value,

    p.product_category_name,
    pay.payment_type,
    pay.payment_value
FROM orders_clean o
JOIN orders_time_features ot
    ON o.order_id = ot.order_id
JOIN order_items oi
    ON o.order_id = oi.order_id
LEFT JOIN products p
    ON oi.product_id = p.product_id
LEFT JOIN payments pay
    ON o.order_id = pay.order_id
WHERE o.order_status = 'delivered';
