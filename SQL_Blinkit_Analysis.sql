-- Blinkit Sales Data Analysis SQL Script
-- Dataset: blinkit_data
-- Objective: Sales performance insights by various factors

--Query:

CREATE DATABASE blinkitdb; ------Create Database
USE blinkitdb; -------------------Switch to the database
CREATE TABLE blinkit_data (
    ItemFatContent VARCHAR(20),
    ItemIdentifier VARCHAR(20),
    ItemType VARCHAR(50),
    OutletEstablishmentYear INT,
    OutletIdentifier VARCHAR(20),
    OutletLocationType VARCHAR(20),
    OutletSize VARCHAR(20),
    OutletType VARCHAR(50),
    ItemVisibility DECIMAL(10,8),
    ItemWeight DECIMAL(5,2) NULL,
    TotalSales DECIMAL(10,2),
    Rating INT
);   
-----------------------------------------------------------------Create a table structure
DESCRIBE blinkit_data;
------------------------------------------------------------Run this command to check your table structure
ALTER TABLE blinkit_data
MODIFY COLUMN ItemWeight DECIMAL(5,2) NULL;
------------------------------------------------Modify Table and It's NOT NULL
SELECT COUNT(*) FROM blinkit_data; ---------------------8524 data records 

SELECT * FROM blinkit_data
LIMIT 10; ---------------------------------------See First 10 Records

SELECT COUNT(*) FROM blinkit_data;
---------------------------------------------Total Number of Records

SELECT DISTINCT ItemType FROM blinkit_data;
--------------------------------------------------------Unique Item Types Available


SELECT OutletLocationType, SUM(TotalSales) AS Total_Sales
FROM blinkit_data
GROUP BY OutletLocationType;
------------------------------------------------------Total Sales by Outlet Location
SELECT OutletType, AVG(Rating) AS Avg_Rating
FROM blinkit_data
GROUP BY OutletType;
-------------------------------------------------Average Rating by Outlet Type
SELECT * FROM blinkit_data
WHERE ItemWeight IS NULL;
--------------------------------------------------------------------Items with Missing ItemWeight
SELECT OutletIdentifier, SUM(TotalSales) AS Total_Sales
FROM blinkit_data
GROUP BY OutletIdentifier
ORDER BY Total_Sales DESC
LIMIT 1;
--------------------------------------------------------------------Highest Total Sales Outlet


SELECT * FROM blinkit_data
WHERE TotalSales > 200;
---------------------------------------Items with Sales greater than 200

UPDATE blinkit_data
SET itemfatcontent = 
CASE 
    WHEN itemfatcontent IN ('LF', 'low fat') THEN 'Low Fat'
    WHEN itemfatcontent = 'reg' THEN 'Regular'
    ELSE itemfatcontent
END;
------------------------------------------------------------Correct SQL Query to Clean itemfatcontent


SELECT DISTINCT itemfatcontent FROM blinkit_data;---------------------------------------Verify Changes

UPDATE blinkit_data
SET itemfatcontent = TRIM(itemfatcontent);----------------------------------Fix Existing Records with Extra Space


SELECT DISTINCT itemfatcontent FROM blinkit_data;------------------------------------Re-check the Values



SELECT SUM(TotalSales) AS Overall_Revenue
FROM blinkit_data;-----------------------------------------------------------------Overall Revenue

SELECT AVG(TotalSales) AS Avg_Revenue_Per_Sale
FROM blinkit_data;
---------------------------------------------------------------------------------Average Revenue Per Sale

SELECT COUNT(DISTINCT ItemIdentifier) AS Total_Different_Items_Sold
    FROM blinkit_data;------------------------------Total Count of Different Items Sold

SELECT COUNT(DISTINCT ItemIdentifier) AS Total_Different_Items_Sold  
FROM blinkit_data;------------------------------Total Count of Different Items Sold

SELECT 
    AVG(Rating) AS Average_Customer_Rating
FROM 
    blinkit_data;
-------------------------------------------------The average customer rating for items sold


SELECT 
    itemfatcontent AS Fat_Content,
    SUM(TotalSales) AS Total_Sales,
    AVG(TotalSales) AS Average_Sales,
    COUNT(*) AS Number_of_Items_Sold,
    AVG(Rating) AS Average_Rating
FROM 
    blinkit_data
GROUP BY 
    itemfatcontent;
-------------------------------------------------------------------Total Sales by Fat Content with Additional KPIs
SELECT 
    ItemType AS Item_Type,
    SUM(TotalSales) AS Total_Sales,
    AVG(TotalSales) AS Average_Sales,
    COUNT(*) AS Number_of_Items_Sold,
    AVG(Rating) AS Average_Rating
FROM 
    blinkit_data
GROUP BY 
    ItemType;
-------------------------------------------------------------------Total Sales by Item Type with Additional KPIs

SELECT 
    OutletIdentifier AS Outlet_ID,
    itemfatcontent AS Fat_Content,
    SUM(TotalSales) AS Total_Sales,
    AVG(TotalSales) AS Average_Sales,
    COUNT(*) AS Number_of_Items_Sold,
    AVG(Rating) AS Average_Rating
FROM 
    blinkit_data
GROUP BY 
    OutletIdentifier, itemfatcontent
ORDER BY 
    OutletIdentifier, itemfatcontent;
---------------------------------------------------------------------Fat Content by Outlet for Total Sales with Additional KPIs

SELECT 
    OutletEstablishmentYear AS Establishment_Year,
    SUM(TotalSales) AS Total_Sales,
    AVG(TotalSales) AS Average_Sales,
    COUNT(*) AS Number_of_Items_Sold,
    AVG(Rating) AS Average_Rating
FROM 
    blinkit_data
GROUP BY 
    OutletEstablishmentYear
ORDER BY 
    OutletEstablishmentYear;
------------------------------------------Total Sales by Outlet Establishment Year with Additional KPIs
SELECT 
    OutletSize,
    SUM(TotalSales) AS Total_Sales,
    ROUND(SUM(TotalSales) * 100 / (SELECT SUM(TotalSales) FROM blinkit_data), 2) AS Sales_Percentage
FROM 
    blinkit_data
GROUP BY 
    OutletSize;
---------------------------------------------------Percentage of Sales by Outlet Size
SELECT 
    OutletLocationType AS Location_Type,
    SUM(TotalSales) AS Total_Sales,
    ROUND(SUM(TotalSales) * 100 / (SELECT SUM(TotalSales) FROM blinkit_data), 2) AS Sales_Percentage
FROM 
    blinkit_data
GROUP BY 
    OutletLocationType
ORDER BY 
    Total_Sales DESC;
---------------------------------------Sales by Outlet Location
SELECT 
    OutletType AS Outlet_Type,
    SUM(TotalSales) AS Total_Sales,
    AVG(TotalSales) AS Average_Sales,
    COUNT(*) AS Number_of_Items_Sold,
    AVG(Rating) AS Average_Rating,
    ROUND(SUM(TotalSales) * 100 / (SELECT SUM(TotalSales) FROM blinkit_data), 2) AS Sales_Percentage
FROM 
    blinkit_data
GROUP BY 
    OutletType
ORDER BY 
    Total_Sales DESC;
--------------------------------------------------All Metrics by Outlet Type

sql
Copy
Edit




sql
Copy
Edit



