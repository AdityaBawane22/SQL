show databases;

create database database_1;
use database_1;

show tables;
select * from diwali_sales_data;
drop database database_1;

ALTER TABLE diwali_sales_data 
DROP COLUMN unnamed1,
DROP COLUMN Status;

-- which state and city is doing more purchases
SELECT State, 
       SUM(Amount) AS Total_Purchase
FROM diwali_sales_data
GROUP BY State
ORDER BY Total_Purchase DESC;

SELECT Zone, 
       SUM(Amount) AS Total_Purchase
FROM diwali_sales_data
GROUP BY Zone
ORDER BY Total_Purchase DESC;

-- which age group made more purchases
SELECT `Age Group`, 
       SUM(Amount) AS Total_Spending
FROM diwali_sales_data
GROUP BY `Age Group`
ORDER BY Total_Spending DESC;

-- which Gender is doing more purchases
SELECT Gender, 
       SUM(Amount) AS Total_Purchase
FROM diwali_sales_data
GROUP BY Gender
ORDER BY Total_Purchase DESC;

-- what married males and females are purchasing
SELECT Gender, Product_Category, 
       SUM(Amount) AS Total_Spending
FROM diwali_sales_data
WHERE Marital_Status = 1
GROUP BY Gender, Product_Category
ORDER BY Gender, Total_Spending DESC;

-- which gender from which occupation is spending more
SELECT Gender, Occupation, 
       SUM(Amount) AS Total_Spending
FROM diwali_sales_data
GROUP BY Gender, Occupation
ORDER BY Total_Spending DESC;

