SHOW databases;

use database_1;

SHOW tables;

SELECT * FROM cars_2010_2020;

-- Count total number of cars in the dataset.
SELECT COUNT(DISTINCT Model)
FROM cars_2010_2020;

-- Find the number of unique car makes.
SELECT COUNT(DISTINCT Manufacturer)
FROM cars_2010_2020;

-- List the top 5 most common car models.
SELECT Model, COUNT(*) AS Top_Car
FROM cars_2010_2020
GROUP BY Model
ORDER BY Top_Car DESC LIMIT 5;

-- Calculate the average price (INR) for each fuel type.
SELECT Fuel_Type, ROUND(AVG(Price_INR), 2) AS Average_Price
FROM cars_2010_2020
GROUP BY Fuel_Type;

-- Find the minimum and maximum engine size in the dataset.
SELECT  MIN(`Engine_Size(L)`) AS Lower_Cap_Eng,
        MAX(`Engine_Size(L)`) AS High_Cap_Eng
FROM cars_2010_2020;

-- INTERMEDIATE LEVEL
-- Calculate average price (INR) per car Maker
SELECT Manufacturer, ROUND(AVG(Price_INR), 2) AS Avg_Price_Per_Mak
FROM cars_2010_2020
GROUP BY Manufacturer;

-- Find the total number of cars produced each year.
SELECT YEAR, COUNT(Model) AS Total_Cars_Each_Year
FROM cars_2010_2020
GROUP BY Year;

-- Show the count of cars grouped by fuel type and Maker
SELECT Manufacturer, Fuel_Type, COUNT(Model) AS Cars_by_Fuel_Type
FROM cars_2010_2020
GROUP BY Manufacturer, Fuel_Type;

-- Which 5 cars have the highest price in INR?
SELECT Manufacturer, Model, Price_INR
FROM cars_2010_2020
ORDER BY Price_INR DESC LIMIT 5;

-- Find cars where engine size is greater than 3.0 liters.
SELECT Manufacturer, Model, `Engine_Size(L)`
FROM cars_2010_2020
WHERE `Engine_Size(L)` > 3;

-- Label cars as ‘Premium’ if Price (INR) > 50,000, else ‘Standard’.
SELECT Manufacturer, Model,
    CASE WHEN Price_INR > 50000 THEN 'Premium'
        ELSE 'Standard'
    END AS Car_Segment
FROM cars_2010_2020;

-- Filter all Electric cars costing more than ₹30,00,000 INR.
SELECT Manufacturer, Model, Fuel_Type, Price_INR AS Exp_Elec_Cars
FROM cars_2010_2020
WHERE Price_INR > 30000 AND Fuel_Type = 'ELectric';

-- Rank cars within each Make based on Price (INR).
SELECT Manufacturer, Model, Price_INR,
DENSE_RANK() OVER(PARTITION BY Manufacturer, Model
                    ORDER BY Price_INR DESC) AS Cars_ranked_on_Price
FROM cars_2010_2020;