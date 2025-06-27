/*Select Entire Table*/
SELECT * FROM pizza_sales.pizza_sales;

/*Total Revenue*/
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales.pizza_sales;

/*Average Order Value*/
select (SUM(total_price)/count(distinct order_id)) as Average_order_value from pizza_sales.pizza_sales;

/*Total Pizzas Sold*/
select sum(quantity) AS Total_pizza_sold from pizza_sales.pizza_sales;

/*Total Orders*/
SELECT count(distinct order_id) As total_orders from pizza_sales.pizza_sales;

/*Average Pizzas Per Order*/
select cast(cast(SUM(quantity) as decimal(10,2))/cast(count(distinct order_id) as decimal (10,2)) as decimal (10,2)) as Average_pizzas_per_order from pizza_sales.pizza_sales;

-- Total Pizzas Sold by Pizza Category
select pizza_category,sum(quantity) as total_pizza_quantity from pizza_sales.pizza_sales group by pizza_category order by total_pizza_quantity desc;

-- Daily Trend for Total Orders
select order_date , COUNT(DISTINCT order_id) AS total_orders from pizza_sales.pizza_sales group by order_date;

-- % of Sales by Pizza Category
select pizza_category , cast(sum(total_price) As decimal (10,2)) AS total_revenue , cast(sum(total_price) * 100/ (select sum(total_price) from pizza_sales.pizza_sales) As decimal (10,2)) as PCT from pizza_sales.pizza_sales group by pizza_category;

-- % of Sales by Pizza Size
select pizza_size , cast(sum(total_price) As decimal (10,2)) AS total_revenue , cast(sum(total_price) * 100/ (select sum(total_price) from pizza_sales.pizza_sales) As decimal (10,2)) as PCT from pizza_sales.pizza_sales group by pizza_size;

-- Top 5 Pizzas by Revenue
SELECT pizza_name, cast(SUM(total_price) AS decimal(10,2)) AS Total_Revenue
FROM pizza_sales.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue desc
LIMIT 5;

-- Bottom 5 Pizzas by Revenue
SELECT pizza_name, cast(SUM(total_price) AS decimal(10,2)) AS Total_Revenue
FROM pizza_sales.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue
LIMIT 5;

-- Top 5 Pizzas by Quantity
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold desc;

-- Bottom 5 Pizzas by Quantity
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold;

-- Top 5 Pizzas by Total Orders
select pizza_name, count(distinct order_id) AS Total_orders 
from pizza_sales.pizza_Sales 
Group by Pizza_name 
order by Total_orders desc
limit 5;

-- Bottom 5 Pizzas by Total Orders
select pizza_name, count(distinct order_id) AS Total_orders 
from pizza_sales.pizza_Sales 
Group by Pizza_name 
order by Total_orders
limit 5;



