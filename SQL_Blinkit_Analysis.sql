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
