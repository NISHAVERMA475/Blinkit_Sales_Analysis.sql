📊 Blinkit Sales Data Analysis – Complete SQL Workflow

Dataset: blinkit_data
Data Import and Table View
Query -
SELECT * FROM blinkit_data;

Objective: Sales Performance & Business Insights
Data Cleaning – Item Fat Content Standardization
Why?
Cleaning the Item_Fat_Content field ensures data consistency. Variations like LF, low fat, and Low Fat can cause incorrect aggregations. By standardizing, we ensure more accurate reporting.

Query -
UPDATE blinkit_data
SET Item_Fat_Content = 
    CASE 
        WHEN Item_Fat_Content IN ('LF', 'low fat') THEN 'Low Fat'
        WHEN Item_Fat_Content = 'reg' THEN 'Regular'
        ELSE Item_Fat_Content
    END;

Whitespace Removal from Standardized Fields
Why?
After cleaning, we found some extra spaces in ‘Regular’ causing duplicates in reporting.

Query - 
UPDATE blinkit_data
SET Item_Fat_Content = TRIM(Item_Fat_Content);

1. Overall Revenue Generated from All Items Sold
SELECT SUM(TotalSales) AS Overall_Revenue
FROM blinkit_data;
Insight: Total revenue generated from all items sold across all outlets.    ![image](https://github.com/user-attachments/assets/1b844dad-1f20-43e2-85b9-2a029c4fb0d0)

2. Average Revenue Per Sale
SELECT AVG(TotalSales) AS Average_Revenue_Per_Sale
FROM blinkit_data;
Insight: On average, each sale contributes this amount to overall revenue.    ![image](https://github.com/user-attachments/assets/9197ef79-2114-45d1-a0b1-019e45ce37e9)


3. Total Count of Different Items Sold
SELECT COUNT(DISTINCT ItemIdentifier) AS Total_Different_Items_Sold
FROM blinkit_data;
Insight: Indicates product variety driving the sales.    ![image](https://github.com/user-attachments/assets/a1eeb89e-c868-4155-8588-a3a3e47163a1)

 4. : The average customer rating for items sold
SELECT 
    AVG(Rating) AS Average_Customer_Rating
FROM 
    blinkit_data;
 Insight: Indicate customer rating by item sold.    ![image](https://github.com/user-attachments/assets/0ae813ac-8772-4de3-bd21-d7ec2bf8f991)


5. Total Sales by Fat Content with Additional KPIs
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
Insight: Understand how product fat content influences sales, quantity sold, and customer satisfaction.    ![image](https://github.com/user-attachments/assets/8a398044-09ca-4c5f-81d6-cea273147f1e)

6. Total Sales by Item Type with Additional KPIs
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
Insight: Identify high-performing product categories contributing to sales and customer satisfaction.    ![image](https://github.com/user-attachments/assets/721684bb-8e2d-4dcf-b8d8-714989393e52)

7. Fat Content by Outlet for Total Sales with Additional KPIs
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
Insight: Compare sales performance of different outlets segmented by fat content.    ![image](https://github.com/user-attachments/assets/785e16b1-1233-4af8-8db3-096463937402)

8. Total Sales by Outlet Establishment Year with Additional KPIs
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
Insight: Evaluate whether newer or older outlets generate higher sales and maintain better ratings.    ![image](https://github.com/user-attachments/assets/4de37372-7ece-4e2b-a49c-32b6fc46839a)


9. Percentage of Sales by Outlet Size
SELECT 
    OutletSize,
    SUM(TotalSales) AS Total_Sales,
    ROUND(SUM(TotalSales) * 100 / (SELECT SUM(TotalSales) FROM blinkit_data), 2) AS Sales_Percentage
FROM 
    blinkit_data
GROUP BY 
    OutletSize;
Insight: Understand how outlet size (Small, Medium, High) contributes to overall sales.    ![image](https://github.com/user-attachments/assets/96a7465a-0007-4247-b577-e2d07ec4e9dc)

10. Sales by Outlet Location
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
Insight: Analyze sales distribution across Tier 1, Tier 2, and Tier 3 locations.    ![image](https://github.com/user-attachments/assets/d8d53754-5de5-4a93-87c9-0f8cdce57e93)

11. All Metrics by Outlet Type
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
![image](https://github.com/user-attachments/assets/ea446289-f1ad-4dec-878e-d7c7d989aacb)


Database Used: MySQL
Tools Used: MySQL Workbench, Microsoft Excel
Schemas:
     ![Schemas](https://github.com/user-attachments/assets/9ac30af9-9b15-4821-9a74-684049ffbba4)
