-- Identify NULL values --

SELECT *
FROM [2023CarsDB]..Cars_DB
WHERE Engine_Size_L IS NULL
OR Entertainment_Features IS NULL
OR Interior_Features IS NULL
OR Exterior_Features IS NULL
OR Customer_Ratings IS NULL
OR Sales_Figures_Units_Sold IS NULL

-- Removing NULL values --

DELETE FROM [2023CarsDB]..Cars_DB
WHERE Engine_Size_L IS NULL
OR Entertainment_Features IS NULL
OR Interior_Features IS NULL
OR Exterior_Features IS NULL
OR Customer_Ratings IS NULL
OR Sales_Figures_Units_Sold IS NULL

-- Overview of Cars DB -- Defining the best car made by sales and by unit sold
-- Top Selling Car Brand by Price --

SELECT TOP 1
Car_Make,
SUM(Price) AS Total_Sales
FROM [2023CarsDB]..Cars_DB
GROUP BY Car_Make
Order BY Total_Sales Desc

-- Top Selling Car Brand by Unit Sold --

SELECT TOP 1
Car_Make,
SUM(Sales_Figures_Units_Sold) AS Total_Unit_Sold
FROM [2023CarsDB]..Cars_DB
GROUP BY Car_Make
Order BY Total_Unit_Sold Desc

-- Sales Performance Analysis --
-- Best Selling Models 

SELECT TOP 10
Car_Make,
Car_Model,
Year,
SUM(Sales_Figures_Units_Sold) AS Total_Unit_Sold
FROM [2023CarsDB]..Cars_DB
GROUP BY 
Car_Make,
Car_Model,
Year
Order BY Total_Unit_Sold Desc

-- Customer Preferences

SELECT TOP 10
Car_Make,
Car_Model,
Body_Type,
Color_Options,
SUM(Sales_Figures_Units_Sold) AS Total_Unit_Sold
FROM [2023CarsDB]..Cars_DB
GROUP BY 
Car_Make,
Car_Model,
Body_Type,
Color_Options
Order BY Total_Unit_Sold Desc

-- Fuel efficiency impact

SELECT
Car_Make,
Car_Model,
Mileage_MPG,
SUM(Sales_Figures_Units_Sold) AS Total_Unit_Sold
FROM [2023CarsDB]..Cars_DB
GROUP BY 
Car_Make,
Car_Model,
Mileage_MPG
ORDER BY Total_Unit_Sold Desc

-- Price Sensitivity

SELECT TOP 10
Car_Make,
Car_Model,
SUM(Price) AS Total_Sales,
AVG(cast(LEFT(Customer_Ratings, 3) as float)) AS Avg_Ratings
FROM [2023CarsDB]..Cars_DB
GROUP BY
Car_Make,
Car_Model
ORDER BY
Total_Sales Desc

-- Safety and features impact

SELECT TOP 10
Car_Make,
Car_Model,
Safety_Features,
Entertainment_Features,
SUM(Price) AS Total_Sales,
AVG(cast(LEFT(Customer_Ratings, 3) as float)) AS Avg_Ratings
FROM [2023CarsDB]..Cars_DB
GROUP BY
Car_Make,
Car_Model,
Safety_Features,
Entertainment_Features
ORDER BY
Total_Sales Desc

-- Market Trend Analysis

SELECT TOP 10
Car_Make,
Car_Model,
Body_Type,
Fuel_Type,
Year,
SUM(Sales_Figures_Units_Sold) AS Total_Unit_Sold
FROM [2023CarsDB]..Cars_DB
GROUP BY 
Car_Make,
Car_Model,
Body_Type,
Fuel_Type,
Year
ORDER BY Total_Unit_Sold Desc
