What are your risk areas? Identify and describe them.
Null Values: Check for NULL values in  mandatory columns 

Data Integrity: Ensure that there are no invalid or inconsistent data values.

Duplicate Data: Ensure that no unwanted duplicates exist in critical tables.


QA Process:

Describe your QA process and include the SQL queries used to execute it.
Checking for duplicates in all_sessions table

SELECT DISTINCT *
FROM all_sessions;