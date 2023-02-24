QUESTION 8

-- In which quarter of 2020, got the maximum total_sold_quantity? The final
-- output contains these fields sorted by the total_sold_quantity,
-- Quarter, total_sold_quantity
  

SELECT SUM(m.sold_quantity) AS Total_Quantity_sold,m.quarter
FROM
     (SELECT X.MONTHS,X.YEARS,X.SOLD_QUANTITY, CASE
			WHEN MONTHS <4  THEN 'Q1'
			WHEN MONTHS >=4 AND MONTHS<7  THEN 'Q2'
			WHEN MONTHS >=7 AND MONTHS<10 THEN 'Q3'
			WHEN MONTHS >=10 THEN 'Q4'
			END AS QUARTER
			FROM(
     SELECT EXTRACT(MONTH FROM dates) AS months ,EXTRACT(YEAR FROM dates) AS years,SUM(sold_quantity) AS sold_quantity
			 FROM fact_sales_monthly
				GROUP BY Extract(YEAR FROM dates),EXTRACT(MONTH FROM dates) 
			) X  
	  WHERE YEARS = 2020)m
	  GROUP BY m.quarter