QUESTION 7
--Get the complete report of the Gross sales amount for the customer “AtliqExclusive” for each month.
--This analysis helps to get an idea of low and high-performing months and take strategic decisions.
--The final report contains these columns:
--Month, Year, Gross sales Amount
  
  
  SELECT X.MONTHS,X.YEARS,X.GROSS_MONTHLY
 FROM
    (SELECT DC.customer,EXTRACT(MONTH FROM F.dates) AS MONTHS,
    EXTRACT(YEAR FROM F.dates) AS YEARS, SUM(F.sold_quantity * FG.gross_price) AS GROSS_MONTHLY 
   FROM ((fact_sales_monthly F
   JOIN dim_customer DC 
  ON  F.customer_code = DC.customer_code)
  JOIN fact_gross_price FG
  ON f.product_code = FG.product_code)
  WHERE DC.CUSTOMER = 'Atliq Exclusive'
 GROUP BY DC.customer, YEARS,MONTHS)X