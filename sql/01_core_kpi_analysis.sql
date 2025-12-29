/*
====================================================
Core KPI Analysis – Olist E-Commerce
====================================================
This file contains foundational business metrics used
for dashboard KPIs and high-level performance tracking.
====================================================
*/

-- Total Number of Orders
SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM sales_master;


-- Total Revenue
SELECT
    ROUND(SUM(payment_value), 2) AS total_revenue
FROM sales_master;


-- Total Unique Customers
SELECT
    COUNT(DISTINCT customer_id) AS total_customers
FROM sales_master;


-- Year-wise Order Trend
SELECT
    order_year,
    COUNT(DISTINCT order_id) AS total_orders
FROM sales_master
GROUP BY order_year
ORDER BY order_year DESC;


-- Month-wise Order Trend
SELECT
    order_year,
    order_month,
    COUNT(DISTINCT order_id) AS total_orders
FROM sales_master
GROUP BY order_year, order_month
ORDER BY order_year DESC, order_month DESC;


-- Month-wise Revenue Trend
SELECT
    order_year,
    order_month,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(payment_value), 2) AS total_revenue
FROM sales_master
GROUP BY order_year, order_month
ORDER BY order_year DESC, order_month DESC;


-- Average Order Value (AOV)
SELECT
    ROUND(SUM(payment_value) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM sales_master;


-- Orders by Payment Type
SELECT
    payment_type,
    COUNT(DISTINCT order_id) AS total_orders
FROM sales_master
GROUP BY payment_type
ORDER BY total_orders DESC;


-- Revenue by Payment Type
SELECT
    payment_type,
    ROUND(SUM(payment_value), 2) AS total_revenue
FROM sales_master
GROUP BY payment_type
ORDER BY total_revenue DESC;


-- Orders by Day of Week
SELECT
    DAYNAME(order_date) AS order_day,
    COUNT(DISTINCT order_id) AS total_orders
FROM sales_master
GROUP BY order_day
ORDER BY total_orders DESC;
