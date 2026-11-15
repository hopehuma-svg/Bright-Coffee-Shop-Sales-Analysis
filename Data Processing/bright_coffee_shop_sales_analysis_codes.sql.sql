SELECT * 
FROM bright_coffee_shop.sales_analysis.bright_coffee_shop_sales;

-- 1. Total Revenue
SELECT
    SUM(transaction_qty * CAST(REPLACE(unit_price, ',', '.') AS DECIMAL(10,2))) AS Total_Revenue
FROM bright_coffee_shop.sales_analysis.bright_coffee_shop_sales
GROUP BY ALL;

SELECT 
      transaction_id,
      SUM (transaction_qty * (CAST (REPLACE (unit_price, ',', '.') AS DECIMAL (10,2)))) AS Total_Revenue
      FROM bright_coffee_shop.sales_analysis.bright_coffee_shop_sales
      GROUP BY ALL;

-- 2. Total Revenue Per Product Category
  SELECT 
       product_category,
       SUM (transaction_qty * (CAST (REPLACE (unit_price,',','.') AS DECIMAL (10,2)))) AS Total_Revenue
  FROM bright_coffee_shop.sales_analysis.bright_coffee_shop_sales
  GROUP BY ALL;

  --3. Total Revenue Per Product Category and Product Dteails
  SELECT 
        product_category,
        product_detail,
        SUM (transaction_qty * (CAST (REPLACE (unit_price, ',','.') AS DECIMAL(10,2)))) AS Total_Revenue
  FROM   bright_coffee_shop.sales_analysis.bright_coffee_shop_sales
  GROUP BY ALL
  ORDER BY Product_category; 

  -- 4. Total Revenue Per Product Type
  SELECT
        product_type,
        SUM (transaction_qty * (CAST (REPLACE (unit_price,',','.') AS DECIMAL (10,2)))) AS Total_Revenue
  FROM   bright_coffee_shop.sales_analysis.bright_coffee_shop_sales
  GROUP BY ALL;   

  5. TOtal Units Sold
  SELECT
        SUM (transaction_qty) AS Total_units_sold
  FROM bright_coffee_shop.sales_analysis.bright_coffee_shop_sales;
  
  6. Total Revenue Per Store Location
  SELECT
        store_location,
        SUM (transaction_qty * (CAST (REPLACE (unit_price, ',','.') AS DECIMAL (10,2)))) AS Total_Revenue
        FROM bright_coffee_shop.sales_analysis.bright_coffee_shop_sales
        GROUP BY ALL;

    -- 7. Total Revenue Based on the Time of the Day

SELECT 
     MIN (transaction_time),
     MAX (transaction_time)
FROM bright_coffee_shop.sales_analysis.bright_coffee_shop_sales;

SELECT
      transaction_time,
      product_category,
CASE 
     WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
     WHEN transaction_time BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
     WHEN transaction_time BETWEEN '17:00:00' AND '19:59:59' THEN 'Evening'
     ELSE 'NIGHT'
END AS time_bucket,
SUM (transaction_qty * (CAST (REPLACE (unit_price, ',','.') AS DECIMAL (10,2)))) AS Total_Revenue
FROM bright_coffee_shop.sales_analysis.bright_coffee_shop_sales
GROUP BY ALL;
-- 6am - 11:59:59 >  Morning
-- 12pm - 16:59:59 > Afternoon       
-- 17pm - 19:59:59 > Evening        
-- After 20pm > Night

-- Number of transactions per time bucket 
SELECT 
    CASE 
     WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
     WHEN transaction_time BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
     WHEN transaction_time BETWEEN '17:00:00' AND '19:59:59' THEN 'Evening'
     ELSE 'Night'
END AS time_bucket,
COUNT (transaction_id) AS total_transactions
FROM bright_coffee_shop.sales_analysis.bright_coffee_shop_sales
GROUP BY ALL;

-- 8. Date extraction (Monthname, month_id, day name)
SELECT 
    transaction_date,
    MONTHNAME (transaction_date) AS month_name,
    MONTH (transaction_date) AS month_id,
    DAYNAME (transaction_date) AS day_name,
    YEAR (transaction_date) AS year
FROM bright_coffee_shop.sales_analysis.bright_coffee_shop_sales
GROUP BY ALL;

-- 9. Revenue per day of the week

SELECT 
    DAYNAME (transaction_date) AS day_name,
    SUM (transaction_qty * (CAST (REPLACE (unit_price, ',','.') AS DECIMAL (10,2)))) AS Total_Revenue
FROM bright_coffee_shop.sales_analysis.bright_coffee_shop_sales
GROUP BY ALL
ORDER BY Total_Revenue DESC;)


------------------------------------------------------------------------------------------------------------------------
-- Combine all the above queries into one table

SELECT 
      transaction_id,
      transaction_date,
      MONTHNAME (transaction_date) AS month_name,
      MONTH (transaction_date) AS month_number,
      DATE_FORMAT (transaction_date, 'yyyy-MM-dd') AS month_id,
      DAYNAME (transaction_date) AS day_name,
      DAYOFWEEK (transaction_date) AS day_number,
      product_category,
      product_type,
      product_detail,
      transaction_qty,
      store_id,
      store_location,
      CASE 
        WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
        WHEN transaction_time BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
        WHEN transaction_time BETWEEN '17:00:00' AND '19:59:59' THEN 'Evening'
        ELSE 'Night'
      END AS time_bucket,
      YEAR (transaction_date) AS year,
      COUNT (transaction_id) AS Total_units_sold,
      SUM (transaction_qty * (CAST (REPLACE (unit_price, ',','.') AS DECIMAL (10,2)))) AS Total_Revenue
FROM bright_coffee_shop.sales_analysis.bright_coffee_shop_sales
GROUP BY ALL;
      