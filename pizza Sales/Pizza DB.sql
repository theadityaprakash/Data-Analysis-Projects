CREATE DATABASE PizzaDB;

USE PizzaDB;

CREATE TABLE Pizza_Sales (
    pizza_id INT,
    order_id INT,
    pizza_name_id VARCHAR(50),
    quantity INT,
    order_date DATE,
    order_time TIME,
    unit_price FLOAT,
    total_price FLOAT,
    pizza_size VARCHAR(50),
    pizza_category VARCHAR(50),
    pizza_ingredients VARCHAR(100),
    pizza_name VARCHAR(50)
);

select * from pizza_Sales;

-- Total Revenue
SELECT SUM(total_price) as Total_Revenue from pizza_Sales;

-- Avarage Order values
select sum(total_price)/count(distinct order_id) as Avarage_order_value from pizza_sales;

-- Total Sales
SELECT SUM(quantity) AS Total_Sold FROM pizza_sales;

-- Total Order Placed
SELECT  COUNT(distinct order_id) AS Total_Order FROM pizza_sales;

-- Average pizza per order
SELECT sum(quantity) / count(distinct order_id) As Avg_pizza_per_order from pizza_sales;
-- Casting this for 2 decimal point Average pizza per order
SELECT CAST(sum(quantity) / count(distinct order_id) AS decimal(10,2)) As Avg_pizza_per_order from pizza_sales;

-- -----------------------------------------------------------------------------------------
-- Daily trend for total order 
SELECT DAYNAME(order_date) AS order_day, COUNT(DISTINCT order_id) AS Total_orders 
FROM pizza_sales
GROUP BY DAYNAME(order_date);

-- Monthly trend for total order
SELECT MONTHNAME(order_date) AS Month_Name, 
COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales 
GROUP BY MONTHNAME(order_date) 
ORDER BY total_orders DESC;

-- percentge of sales by pizza category
SELECT pizza_category, sum(total_price) *  100 / ( select sum(total_price) from pizza_sales) as total_sales
from pizza_sales group by pizza_category;

-- percentge of sales by pizza size
SELECT pizza_size, cast( sum(total_price) *  100 / ( select sum(total_price) from pizza_sales) as decimal(10,2) )as total_sales
from pizza_sales group by pizza_size;

-- Top 5 best seller by revenue 
SELECT pizza_name, SUM(total_price) AS total_revenue 
FROM pizza_sales 
GROUP BY pizza_name 
ORDER BY total_revenue DESC 
LIMIT 5;

-- Bottom 5 best seller by revenue 
SELECT pizza_name, SUM(total_price) AS total_revenue 
FROM pizza_sales 
GROUP BY pizza_name 
ORDER BY total_revenue ASC 
LIMIT 5;

-- Top 5 best seller by toatl quantity
SELECT pizza_name, SUM(quantity) AS total_quantity 
FROM pizza_sales 
GROUP BY pizza_name 
ORDER BY total_quantity DESC 
LIMIT 5;

-- Bottom 5 best seller by toatl quantity
SELECT pizza_name, SUM(quantity) AS total_quantity 
FROM pizza_sales 
GROUP BY pizza_name 
ORDER BY total_quantity ASC
LIMIT 5;

-- Top 5 best seller by total orders
SELECT pizza_name, COUNT(DISTINCT order_id) AS total_order 
FROM pizza_sales 
GROUP BY pizza_name 
ORDER BY total_order DESC 
LIMIT 5;


-- Bottom 5 best seller by total orders
SELECT pizza_name, COUNT(DISTINCT order_id) AS total_order 
FROM pizza_sales 
GROUP BY pizza_name 
ORDER BY total_order ASC
LIMIT 5;


