Create Database PizzaDB
Use PizzaDb

select * from [dbo].[pizza_sales]
--1. KPI
--Total Revenue 
Select SUM(total_price)AS tOTAL_revenue from pizza_sales

--Aveerage Order Value
Select sum(total_price) / Count(Distinct order_id) as Average_order_value from pizza_sales

--Total Pizza Solds
Select sum(quantity) as Total_Pizza_Solds from pizza_sales

--Total Order Placed
Select COUNT(Distinct order_id) as Total_orders From pizza_sales

--Average PIzzas per Order
Select cast(cast(sum(quantity) as decimal(10,2)) / 
Cast(Count(Distinct order_id) as decimal (10,2)) as decimal (10,2)) as avG_pizza_per_order from pizza_sales


-- 2. CHARTS REQUIREMENT

--Daily Trend for Total Order
select DATENAME (DW, order_date) as order_day, COUNT (DISTINCT order_id) as Total_Orders
from pizza_sales
Group by DATENAME (DW, order_date) 

-- Monthly Trend for Orders
Select DATENAME(Month, order_date) as Month_Name, Count(Distinct order_id) as Total_Orders
from pizza_sales
group by DATENAME(Month, order_date) 
Order By Total_Orders DESc

--Percentage of Sales by Pizza Category:
Select  pizza_category, sum (total_price)As total_sales, sum(total_price) * 100/ 
(Select sum(total_price) from pizza_sales)as Total_sales
from  pizza_sales 
Where Month(order_date) = 1
Group By pizza_category


--Percentage of Sales  by pizza size
Select  pizza_size, sum (total_price)As total_sales, sum(total_price) * 100/ 
(Select sum(total_price) from pizza_sales)as Total_sales
from  pizza_sales 
Where Month(order_date) = 1
Group By pizza_size


--Top 5 Best sellers by revenue, Total Quantity and Total Orders
Select TOP 5 pizza_name, Sum(total_price) as Total_revenue from pizza_sales 
group by pizza_name
Order by Total_revenue DESC

Select TOP 5 pizza_name, Sum(quantity) as Total_quantity from pizza_sales 
group by pizza_name
Order by Total_Quantity DESC

Select TOP 5 pizza_name, Count(Distinct order_id) as Total_Orders from pizza_sales 
group by pizza_name
Order by Total_Orders DESC










