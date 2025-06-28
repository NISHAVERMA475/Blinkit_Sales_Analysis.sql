# Blinkit Sales Data Analysis SQL Project
Dataset: blinkit_data
Objective: Sales Performance & Business Insights

------------------------------------------------------------
1. Overall Revenue Generated from All Items Sold
Query -
SELECT SUM(TotalSales) AS Overall_Revenue
FROM blinkit_data;
Insight: Total revenue generated from all items sold across all outlets.

------------------------------------------------------------
2. Average Revenue Per Sale
Query -
SELECT AVG(TotalSales) AS Average_Revenue_Per_Sale
FROM blinkit_data;
Insight: On average, each sale contributes this amount to overall revenue.

------------------------------------------------------------
3. Total Count of Different Items Sold
Query -
SELECT COUNT(DISTINCT ItemIdentifier) AS Total_Different_Items_Sold
FROM blinkit_data;
Insight: Indicates product variety driving the sales.

------------------------------------------------------------
4. Total Sales by Fat Content with Additional KPIs
Query -
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
Insight: Understand how product fat content influences sales, quantity sold, and customer satisfaction.

------------------------------------------------------------
5. Total Sales by Item Type with Additional KPIs
Query -
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
Insight: Identify high-performing product categories contributing to sales and customer satisfaction.

------------------------------------------------------------
6. Fat Content by Outlet for Total Sales with Additional KPIs
Query -
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
Insight: Compare sales performance of different outlets segmented by fat content.

------------------------------------------------------------
7. Total Sales by Outlet Establishment Year with Additional KPIs
Query -
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
Insight: Evaluate whether newer or older outlets generate higher sales and maintain better ratings.

------------------------------------------------------------
8. Percentage of Sales by Outlet Size
Query -
SELECT 
    OutletSize,
    SUM(TotalSales) AS Total_Sales,
    ROUND(SUM(TotalSales) * 100 / (SELECT SUM(TotalSales) FROM blinkit_data), 2) AS Sales_Percentage
FROM 
    blinkit_data
GROUP BY 
    OutletSize;
Insight: Understand how outlet size (Small, Medium, High) contributes to overall sales.

------------------------------------------------------------
9. Sales by Outlet Location
Query -
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
Insight: Analyze sales distribution across Tier 1, Tier 2, and Tier 3 locations.

------------------------------------------------------------
10. All Metrics by Outlet Type
Query -
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
Insight: Comprehensive outlet performance report based on total sales, average sales, quantity sold, rating, and sales contribution percentage.
