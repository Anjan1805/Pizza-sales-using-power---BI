use PizzaDB;
selecT* from pizza_sales;

--PROBLEM STATEMENT 
--CHARTS REQUIREMENT 
--We would like to visualize various aspects of our pizza sales data to gain insights and understand key trends. We have identified the following requirements for creating charts: 
--1.Daily Trend for Total Orders:
--Create a bar chart that displays the daily trend of total orders over a specific time period. 
--This chart will help us identify any patterns or fluctuations in order volumes on a daily basis. 
select datename(dw,order_date) as order_day, count(distinct order_id) as total_order
from pizza_sales
group by  datename(dw,order_date) ; 
--2.Hourly Trend for Total Orders: 
--Create a line chart that illustrates the hourly trend of total orders throughout the day. 
--This chart will allow us to identify peak hours or periods of high order activity. 
select datename(MONTH,order_date) as month_name, count(distinct order_id) as  total_order
from pizza_sales
group by  datename(MONTH,order_date)
ORDER BY total_order desc; 

--3.Percentage of Sales by Pizza Category: 
--Create a pie chart that shows the distribution of sales across different pizza categories. 
-- This chart will provide insights into the popularity of various pizza categories and their contribution to overall sales.
select pizza_category,sum(total_price) as total_sales , sum(total_price)*100 /(select sum(total_price) from pizza_sales) as total_sales_percent
from pizza_sales
group by  pizza_category;

--suppose we want only for month january
select pizza_category,sum(total_price) as total_sales , sum(total_price)*100 /(select sum(total_price) from pizza_sales where month(order_date) =1) as total_sales_percent
from pizza_sales
where month(order_date) =1
group by  pizza_category;

--suppose we want for for 1st quater
select pizza_category,sum(total_price) as total_sales , sum(total_price)*100 /(select sum(total_price) from pizza_sales where datepart (Quarter, order_date) =1) as total_sales_percent
from pizza_sales
where datepart (Quarter, order_date) =1
group by  pizza_category;


-- 4.Percentage of Sales by Pizza Size: 
-- Generate a pie chart that represents the percentage of sales attributed to different pizza sizes. 
-- This chart will help us understand customer preferences for pizza sizes and their impact on sales.
select pizza_size,cast(sum(total_price) as decimal(10,2)) as total_sales , cast(sum(total_price)*100 /(select sum(total_price) from pizza_sales) as decimal(10,2)) as  total_sales_percent
from pizza_sales
group by  pizza_size
order by total_sales_percent desc;
 

-- 5.Total Pizzas Sold by Pizza Category: 
-- Create a funnel chart that presents the total number of pizzas sold for each pizza category. 
-- This chart will allow us to compare the sales performance of different pizza categories. 

select pizza_category, sum(total_price) as totaL_sales
from pizza_sales
group by pizza_category;

-- 6.Top 5 Best Sellers by Revenue, Total Quantity and Total Orders 
-- Create a bar chart highlighting the top 5 best-selling pizzas based on the Revenue, Total Quantity, Total Orders. 
-- This chart will help us identify the most popular pizza options. 

-- by revenue
select top 5 pizza_name, sum(total_price) as totaL_revenue
from pizza_sales
group by pizza_name
order by total_revenue desc;

-- by total quantity
select top 5 pizza_name, sum(quantity) as totaL_quantity
from pizza_sales
group by pizza_name
order by total_quantity desc;

-- by total orders
select top 5 pizza_name, count (distinct order_id) as totaL_order
from pizza_sales
group by pizza_name
order by total_order desc;



-- 7. Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders 
-- Create a bar chart showcasing the bottom 5 worst-selling pizzas based on the Revenue, Total Quantity, Total Orders. 
-- This chart will enable us to identify underperforming or less popular pizza options.

--  by total revenue 
select top 5 pizza_name, sum(total_price) as totaL_revenue
from pizza_sales
group by pizza_name
order by total_revenue;

-- by total quantity
select top 5 pizza_name, sum(quantity) as totaL_quantity
from pizza_sales
group by pizza_name
order by total_quantity;

-- by total orders
select top 5 pizza_name, count (distinct order_id) as totaL_order
from pizza_sales
group by pizza_name
order by total_order;

