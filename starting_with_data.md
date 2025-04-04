Question 1: How many rows are in all_sessions

SQL Queries:

SELECT COUNT(*) FROM all_sessions;

Answer: 



Question 2: What are the column names and data types? analytics table

SQL Queries:

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'analytics';

Answer:



Question 3: What are the distinct values in 'country' column in all_sessions table

SQL Queries:

SELECT DISTINCT country FROM all_sessions;

Answer:



Question 4: How many unique values are there in a column?

SQL Queries: 

SELECT COUNT(DISTINCT name) FROM products;

Answer:



Question 5:  What is the maximum and minimum value in totalordered column? sales_by_sku table

SQL Queries: SELECT MAX(totalordered) AS max_value, MIN(totalordered) AS min_value
FROM sales_by_sku;

Answer:
