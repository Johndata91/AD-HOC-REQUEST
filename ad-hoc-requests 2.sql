Question 2
--  What is the percentage of unique product increase in 2021 vs. 2020? The
--final output contains these fields, unique_products_2020, unique_products_2021, percentage_chg

 
 SELECT COUNT(DISTINCT CASE WHEN FISCAL_YEAR ='2021' THEN product_code END) AS UNIQUE_PRODUCT_2021,
	  COUNT(DISTINCT CASE WHEN FISCAL_YEAR ='2020' THEN product_code END) AS UNIQUE_PRODUCT_2020,
	(((COUNT(DISTINCT CASE WHEN FISCAL_YEAR ='2021' THEN product_code END) - COUNT(DISTINCT CASE WHEN FISCAL_YEAR ='2020' THEN product_code END))*100)
	 / COUNT(DISTINCT CASE WHEN FISCAL_YEAR ='2020' THEN product_code END)) AS Percentage_chg
		FROM Fact_sales_monthly;