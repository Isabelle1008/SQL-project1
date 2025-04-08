Question 1: How many rows are in sales_report

SQL Queries:

SELECT COUNT(*) FROM sales_report;

Answer: "count"
"454"



Question 2: What are the column names and data types? analytics table

SQL Queries:

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'analytics';

Answer:

"column_name","data_type"
"unitssold","smallint"
"pageviews","smallint"
"timeonsite","smallint"
"bounces","smallint"
"revenue","bigint"
"unitprice","bigint"
"visitstarttime","integer"
"date","date"
"socialengagementtype","character varying"
"visitid","character varying"
"fullvisitorid","character varying"
"userid","character varying"
"channelgrouping","character varying"
"visitnumber","character varying"


Question 3: Most active visitor based on number of sessions

SQL Queries:

SELECT 
    fullvisitorid, 
    COUNT(*) AS session_count
FROM 
    all_sessions
GROUP BY 
    fullvisitorid
ORDER BY 
    session_count DESC
LIMIT 1;

Answer:

"fullvisitorid","session_count"
"8174358870162124945","1"


Question 4: How many unique values are there in a column?

SQL Queries: 

SELECT COUNT(DISTINCT name) 
FROM products;

Answer:"count"
"313"




Question 5:  What is the maximum and minimum value in totalordered column? sales_by_sku table

SQL Queries: SELECT MAX(totalordered) AS max_value, MIN(totalordered) AS min_value
             FROM sales_by_sku;

Answer:
"max_value","min_value"
456,0