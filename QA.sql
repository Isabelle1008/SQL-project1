--Quality assurance

What are your risk areas? Identify and describe them.
The reliability, accuracy, and integrity of e-commerce data

-- QA Process:

Describe your QA process and include the SQL queries used to execute it.



--Null Values: Fix Missing or Null Values in Critical Columns

SELECT fullvisitorid, country, visitid, city, v2productcategory 
FROM all_sessions
WHERE fullvisitorid IS NULL OR country IS NULL OR visitid IS NULL OR city IS NULL OR v2productcategory IS NULL;

SELECT fullvisitorid, unitprice, visitid
FROM analytics
WHERE fullvisitorid IS NULL OR unitprice IS NULL OR visitid IS NULL;

SELECT totalordered, name
 FROM sales_report
 WHERE totalordered IS NULL OR name IS NULL; 
 
 SELECT totalordered
 FROM sales_by_sku
 WHERE totalordered IS NULL;


-- Duplicate Data: Ensure that no unwanted duplicates exist in critical tables.

WITH CTE AS(
    SELECT fullvisitorid, visitid, ROW_NUMBER() OVER (PARTITION BY visitid ORDER BY fullvisitorid ASC) AS RowNum
        FROM all_sessions
)
DELETE FROM all_sessions
WHERE fullvisitorid IN (SELECT fullvisitorid FROM CTE WHERE RowNum > 1);

;


-- Validate Data Types

SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'all_sessions';

SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'analytics';

SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'products';

SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'sales_report';

SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'sales_by_sku';

 -- compare count and average to help understand patterns about visitors and their  sessions. if they tend to order more products, or if there's a specific trend based on the count of sessions compared to the average products ordered.

* Query

SELECT 
    fullvisitorid, 
    COUNT(*) AS session_count,
    AVG(totalordered) AS avg_products_ordered
FROM 
    all_sessions al
	JOIN sales_report s
	ON al.productsku = s.productsku
GROUP BY 
    fullvisitorid
ORDER BY 
    session_count DESC