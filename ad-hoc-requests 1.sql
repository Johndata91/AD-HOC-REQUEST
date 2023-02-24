--Question 1
--Provide the list of markets in which customer "Atliq Exclusive" operates its
--business in the APAC region.

SELECT DISTINCT market 
FROM public.dim_customer
WHERE region = 'APAC' AND Customer = 'Atliq Exclusive'