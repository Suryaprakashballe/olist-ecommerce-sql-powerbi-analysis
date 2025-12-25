select count(distinct order_id) as total_orders from sales_master;

select round(sum(payment_value),2) as total_revenue from sales_master;

select count(distinct customer_id) as total_customers from sales_master;

select order_year,count(distinct order_id) as total_orders from sales_master
group by order_year
order by order_year desc;

select order_year,order_month,count(distinct order_id) as total_orders from sales_master
group by order_year,order_month
order by order_year desc;

select order_year,order_month,count(distinct order_id) as total_orders,round(sum(payment_value),2) as total_revenue from sales_master
group by order_year,order_month
order by order_year desc;

select round(sum(payment_value) / count(distinct order_id), 2) as avg_order_value from sales_master;

SELECT 
    payment_type,
    COUNT(DISTINCT order_id) AS total_orders
FROM sales_master
GROUP BY payment_type
ORDER BY total_orders DESC;

SELECT payment_type,round(sum(payment_value),2) as revenue FROM sales_master
GROUP BY payment_type
ORDER BY revenue DESC;

select order_day,count(distinct order_id) as total_orders from (select order_id , dayname(order_date) as order_day from sales_master) t
group by order_day
order by order_day desc;