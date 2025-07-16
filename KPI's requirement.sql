use PizzaDB;
select* from pizza_sales;
-- KPI's REQUIREMENT 
--We need to analyze key indicators for our pizza sales data to gain insights into our business performance. Specifically, we want to calculate the following metrics: 
 

-- 1. Total Revenue: The sum of the total price of all pizza orders. 
select sum(total_price) as Total_revenue 
from pizza_sales;
--2. Average Order Value: The average amount spent per order, calculated by dividing the total revenue by the total number of orders. 
select sum(total_price)/ count(distinct order_id) as avg_order_value from pizza_sales;
--3. Total Pizzas Sold: The sum of the quantities of all pizzas sold. 
select sum(quantity) as total_sales from pizza_sales;

--4. Total Orders: The total number of orders placed. 
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales ;

--5. Average Pizzas Per Order: The average number of pizzas sold per order, calculated by dividing the total number of pizzas sold by the total number of orders.
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) /
CAST(COUNT (DISTINCT order_id) AS DECIMAL (10,2)) AS DECIMAL(10,2)) 
AS Avg_Pizzas_per_order 
FROM pizza_sales;



