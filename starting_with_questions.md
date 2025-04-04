Answer the following questions and provide the SQL queries used to find the answer.

    
**Question 1: Which cities and countries have the highest level of transaction revenues on the site?**


SQL Queries:
SELECT
    country,GF
    city,
    SUM(totaltransactionrevenue) AS total_revenue
FROM
    all_sessions
   WHERE totaltransactionrevenue IS NOT NULL
GROUP BY
    country, city
ORDER BY
    total_revenue DESC
LIMIT 10; 


Answer:



**Question 2: What is the average number of products ordered from visitors in each city and country?**


SQL Queries:

SELECT AVG (totalordered) AS avg_products_ordered	
FROM sales_report s
JOIN all_sessions a
ON s.productsku= a.productsku
WHERE totalordered IS NOT NULL  
GROUP BY country, city
ORDER BY avg_products_ordered DESC;




Answer:





**Question 3: Is there any pattern in the types (product categories) of products ordered from visitors in each city and country?**


SQL Queries:

SELECT a.country, a.city, a.v2productcategory,
    COUNT(a.productsku) AS product_count
FROM
    all_sessions a
JOIN
    sales_report s ON a.productsku = s.productsku
GROUP BY
    a.country, a.city, a.v2productcategory
ORDER BY
    a.country, a.city, product_count DESC;

Answer:





**Question 4: What is the top-selling product from each city/country? Can we find any pattern worthy of noting in the products sold?**


SQL Queries:

SELECT a.city, s.productsku, s.name,
    SUM(s.totalordered) AS total_sales
    FROM
        sales_report s
    JOIN
        all_sessions a ON s.productsku = a.productsku
    GROUP BY
        a.city, s.productsku, s.name


Answer:





**Question 5: Can we summarize the impact of revenue generated from each city/country?**

SQL Queries:
SELECT
    a.country,
    a.city,
    COUNT(DISTINCT a.totaltransactionrevenue) AS total_transaction,
    SUM(s.totalordered * a.productprice) AS total_revenue,
    AVG(s.totalordered * a.productprice) AS avg_revenue
FROM
    all_sessions a
JOIN sales_report s  
ON a.productsku = s.productsku
JOIN
    products p ON s.productsku = p.sku
WHERE
    p.orderedquantity > 0 
GROUP BY
    a.country, a.city
ORDER BY
    total_transaction DESC;




Answer:







