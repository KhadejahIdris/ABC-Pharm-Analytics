--Sales Performance Analysis
--Analyzing the total sales for each product and identifying top selling products
SELECT ProductName, 
       SUM(Sales) AS TotalSales
FROM ABCPharmData
GROUP BY ProductName
ORDER BY TotalSales DESC
LIMIT 10;

---Analyzing month by month Sales
SELECT Year, Month, SUM(Sales) AS MonthlySales
FROM ABCPharmData
GROUP BY Year, Month
ORDER BY Year, Month;

--Better still, let us convert the month column to numeric format so as to properly order

SELECT Year,
       CASE 
           WHEN Month = 'January' THEN 1
           WHEN Month = 'February' THEN 2
           WHEN Month = 'March' THEN 3
           WHEN Month = 'April' THEN 4
           WHEN Month = 'May' THEN 5
           WHEN Month = 'June' THEN 6
           WHEN Month = 'July' THEN 7
           WHEN Month = 'August' THEN 8
           WHEN Month = 'September' THEN 9
           WHEN Month = 'October' THEN 10
           WHEN Month = 'November' THEN 11
           WHEN Month = 'December' THEN 12
       END AS MonthNum,
       SUM(Sales) AS MonthlySales
FROM ABCPharmData
GROUP BY Year, Month
ORDER BY Year ASC, MonthNum ASC;


----Identifying Cities with the highest sales
SELECT City,
       SUM(Sales) AS TotalSales
FROM ABCPharmData
GROUP BY City
ORDER BY TotalSales DESC
LIMIT 10;


--Analyzing sales preformance across countries
SELECT Country, 
	   SUM(Sales) AS TotalSales
FROM ABCPharmData
GROUP BY Country
ORDER BY TotalSales DESC;

--Comparing sales across cities, and then countries

 SELECT Country, City, 
		SUM(Sales) AS TotalSales
FROM ABCPharmData
GROUP BY Country, City
ORDER BY Country ASC, TotalSales DESC
LIMIT 10;

--Customer Segment Analysis
--Determining Sales by Customer type(Channel)
SELECT Channel, 
	   SUM(Sales) AS TotalSales
FROM ABCPharmData
GROUP BY Channel
ORDER BY TotalSales DESC;

---Analyzing sales performance across various subchannels
SELECT Channel, Subchannel, 
	   SUM(Sales) AS TotalSales
FROM ABCPharmData
GROUP BY Channel, Subchannel
ORDER BY Channel ASC, TotalSales DESC;


--Product Analysis
--To identify the top products for each product class, we can do this individually or collectivley
-----To do it individually, lets take one product class; Analgesics
SELECT ProductName, ProductClass,
	   SUM(Sales) AS TotalSales
FROM ABCPharmData
WHERE ProductClass = 'Analgesics'
GROUP BY ProductName
ORDER BY TotalSales DESC
LIMIT 10;

--We can also do this for all product classes at once
WITH RankedProducts AS (
    SELECT 
        ProductClass,
        ProductName,
        SUM(Sales) AS TotalSales,
        ROW_NUMBER() OVER (PARTITION BY ProductClass ORDER BY SUM(Sales) DESC) AS Rank
    FROM ABCPharmData
    GROUP BY ProductClass, ProductName
)
SELECT ProductClass, ProductName, TotalSales
FROM RankedProducts
WHERE Rank <= 5
ORDER BY ProductClass, Rank;

---Determining Average Price for each product class
SELECT ProductClass, 
	   AVG(Price) AS AvgPrice
FROM ABCPharmData
GROUP BY ProductClass
ORDER BY AvgPrice DESC;


--SalesRepresentative Performance
--Identifying top performing Sale Representatives
SELECT SalesRep, SalesTeam,
	  SUM(Sales) AS TotalSales
FROM ABCPharmData
GROUP BY SalesRep
ORDER BY TotalSales DESC;

--Analyzing Sales Performance across the various Sales teams
SELECT SalesTeam,
	   SUM(Sales) AS TotalSales
FROM ABCPharmData
GROUP BY SalesTeam
ORDER BY TotalSales DESC;

--Measuring Growth trend over the years
WITH YearlySales AS (
    SELECT Year, 
	SUM(Sales) AS TotalSales
    FROM ABCPharmData
    GROUP BY Year
),
Growth AS (
    SELECT 
        Year,
        TotalSales,
        LAG(TotalSales) OVER (ORDER BY Year) AS PreviousYearSales,
        CASE 
            WHEN LAG(TotalSales) OVER (ORDER BY Year) IS NOT NULL 
            THEN ((TotalSales - LAG(TotalSales) OVER (ORDER BY Year)) * 100.0 / LAG(TotalSales) OVER (ORDER BY Year))
            ELSE NULL 
        END AS GrowthRate
    FROM YearlySales
)
SELECT Year, TotalSales, PreviousYearSales, GrowthRate
FROM Growth
ORDER BY Year;

--Identifying seasonal sales patterns
--Analyzing Average monthly sales
SELECT Month, 
	   AVG(Sales) AS AverageMonthlySales
FROM ABCPharmData
GROUP BY Month
ORDER BY AverageMonthlySales DESC;

---Analyzing monthly sales  for each year 
SELECT Year, Month, SUM(Sales) AS MonthlySales
FROM ABCPharmData
GROUP BY Year, Month
ORDER BY Month ASC, Year ASC;
