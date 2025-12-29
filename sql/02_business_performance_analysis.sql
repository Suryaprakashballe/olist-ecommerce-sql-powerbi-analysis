/*
====================================================
Business Performance Analysis – Olist E-Commerce
====================================================
This file answers key business questions related to:
- Revenue contribution
- Top products and categories
- Seller performance
- Delivery cost impact
====================================================
*/

-- Top 10 Products by Revenue
SELECT
    product_id,
    product_category_name,
    ROUND(SUM(payment_value), 2) AS total_revenue
FROM sales_master
GROUP BY product_id, product_category_name
ORDER BY total_revenue DESC
LIMIT 10;


-- Top 10 Sellers by Revenue
SELECT
    seller_id,
    ROUND(SUM(payment_value), 2) AS total_revenue
FROM sales_master
GROUP BY seller_id
ORDER BY total_revenue DESC
LIMIT 10;


-- Top 10 Product Categories by Total Orders
SELECT
    product_category_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM sales_master
GROUP BY product_category_name
ORDER BY total_orders DESC
LIMIT 10;


-- Top 10 Product Categories by Revenue
SELECT
    product_category_name,
    ROUND(SUM(payment_value), 2) AS total_revenue
FROM sales_master
GROUP BY product_category_name
ORDER BY total_revenue DESC
LIMIT 10;


-- Average Revenue per Order by Product Category
SELECT
    product_category_name,
    ROUND(SUM(payment_value) / COUNT(DISTINCT order_id), 2) AS avg_revenue_per_order
FROM sales_master
GROUP BY product_category_name
ORDER BY avg_revenue_per_order DESC
LIMIT 10;


-- Average Product Price and Delivery Cost
SELECT
    ROUND(AVG(price), 2) AS avg_product_price,
    ROUND(AVG(freight_value), 2) AS avg_delivery_cost
FROM sales_master;


-- Delivery Cost as Percentage of Product Price by Category
SELECT
    product_category_name,
    ROUND(AVG(freight_value / price) * 100, 2) AS delivery_cost_percentage
FROM sales_master
WHERE price > 0
GROUP BY product_category_name
ORDER BY delivery_cost_percentage DESC
LIMIT 10;


-- Seller Performance: Orders vs Revenue
SELECT
    seller_id,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(payment_value), 2) AS total_revenue
FROM sales_master
GROUP BY seller_id
ORDER BY total_revenue DESC
LIMIT 10;
