What issues will you address by cleaning the data?





Queries:
Below, provide the SQL queries you used to clean your data.

SELECT fullVisitorid
    FROM analytics
    GROUP BY fullVisitorid
    HAVING COUNT(*) > 1;

   
