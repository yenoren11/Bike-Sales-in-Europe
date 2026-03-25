CREATE DATABASE bike_sales

USE bike_sales

SELECT *
FROM Sales_Cleaned

-- Total revenue, cost, and profit by country
SELECT 
	Country,
	SUM(Revenue) AS Total_Revenue,
	SUM(Cost) AS Total_Cost,
	SUM(Profit) AS Total_Profit,
	ROUND(AVG(Profit_Margin), 3) AS Avg_Margin
FROM Sales_Cleaned
GROUP BY Country
ORDER BY Total_Profit DESC
GO

-- Revenue contribution by State
SELECT 
	Country,
	State,
	SUM(Revenue) AS Total_Revenue,
	SUM(SUM(Revenue)) OVER(PARTITION BY Country) AS Country_Total,
	CAST(SUM(Revenue) *100.0 / SUM(SUM(Revenue)) OVER(PARTITION BY Country) AS DECIMAL(10,2)) AS Percent_Contribution
FROM Sales_Cleaned
GROUP BY Country,State
ORDER BY Country, Total_Revenue DESC
GO

-- Find the top 5 products with the highest total profit
WITH Producting_Ranking AS (
	SELECT 
		Product,
		SUM(Profit) AS Total_Product_Profit,
		DENSE_RANK() OVER (ORDER BY SUM(Profit) DESC) AS Rank_Num
	FROM Sales_Cleaned
	GROUP BY Product
)
SELECT *
FROM Producting_Ranking
WHERE Rank_Num <= 5
GO

-- Calculate this month's revenue compared to last month (Month-over-Month Growth)
WITH Monthly_Sales AS (
	SELECT
		Year, Month, 
		SUM(Revenue) AS Monthly_Revenue,
		LAG(SUM(Revenue)) OVER (ORDER BY Year,
			CASE Month
				WHEN 'January' THEN 1 WHEN 'February' THEN 2 WHEN 'March' THEN 3 
				WHEN 'April' THEN 4 WHEN 'May' THEN 5 WHEN 'June' THEN 6 
				WHEN 'July' THEN 7 WHEN 'August' THEN 8 WHEN 'September' THEN 9 
				WHEN 'October' THEN 10 WHEN 'November' THEN 11 WHEN 'December' THEN 12
			END) AS Prev_Month_Revenue
	FROM Sales_Cleaned
	GROUP BY Year, Month
)
SELECT Year, Month, 
	Monthly_Revenue, Prev_Month_Revenue,
	(Monthly_Revenue - Prev_Month_Revenue) * 100 / Prev_Month_Revenue AS Growth_Rate
FROM Monthly_Sales
GO

-- Which age group and gender spend the most money on 'Bikes' products?
SELECT 
    Age_Group, 
    Customer_Gender, 
    SUM(Revenue) AS Total_Revenue,
    COUNT(*) AS Order_Count
FROM Sales_Cleaned
WHERE Product_Category = 'Bikes'
GROUP BY Age_Group, Customer_Gender
ORDER BY Total_Revenue DESC
GO

-- Find orders that are 10 times the average value
SELECT * 
FROM Sales_Cleaned
WHERE Revenue > (SELECT AVG(Revenue) * 10 FROM Sales_Cleaned)
GO