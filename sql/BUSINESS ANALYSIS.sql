--bussiness analysis

select product_id,product_category_name,round(sum(payment_value),2) as revenue from sales_master
group by product_id,product_category_name
order by revenue desc
limit 10;

select seller_id,round(sum(payment_value),2) as revenue from sales_master
group by seller_id
order by revenue desc
limit 10;

select product_category_name,count(distinct order_id) as total_orders from sales_master
group by product_category_name
order by total_orders desc
limit 10;

select product_category_name,round(sum(payment_value),2) as revenue from sales_master
group by product_category_name
order by revenue desc
limit 10;

select product_category_name,round(sum(payment_value) / count(order_id) ,2) as avg_revenue from sales_master
group by product_category_name
order by avg_revenue desc
limit 10;

select round(avg(freight_value),2) as avg_delivery_price,round(avg(price),2) as avg_product_price from sales_master;

select product_category_name,round(avg(freight_value/price) * 100 ,2) as delivery_percent from sales_master
where price>0
group by product_category_name
order by delivery_percent desc
limit 10;

select seller_id,count(distinct order_id) as total_orders,round(sum(payment_value),2) as revenue from sales_master
group by seller_id
order by revenue desc
limit 10;
