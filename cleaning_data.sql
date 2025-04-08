-- What issues will you address by cleaning the data?
duplicates
Null value
Change date type
clean the unitprice column


Queries:


SELECT fullVisitorid
    FROM analytics
    GROUP BY fullVisitorid
    HAVING COUNT(*) > 1;

-- remove duplicates
   
WITH CTE AS(
    SELECT fullvisitorid, visitid, ROW_NUMBER() OVER (PARTITION BY visitid ORDER BY fullvisitorid ASC) AS RowNum
        FROM all_sessions
)
DELETE FROM all_sessions
WHERE fullvisitorid IN (SELECT fullvisitorid FROM CTE WHERE RowNum > 1);

-- null values

SELECT * FROM all_sessions
WHERE
     fullvisitorid is NULL;


-- analytics table unitprice

 SELECT unitprice / 1000000 AS unit_price_in_millions
    FROM analytics;

    UPDATE analytics
SET unitprice = unitprice / 1000000;