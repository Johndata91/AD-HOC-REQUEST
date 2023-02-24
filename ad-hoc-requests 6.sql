
QUESTION 6
--Generate a report which contains the top 5 customers who received an
--average high pre_invoice_discount_pct for the fiscal year 2021 and in theIndian market. 
--The final output contains these fields,
--customer_code, customer, average_discount_percentage 

SELECT X.customer_code,x.customer,X.average_discount_percentage
	FROM	
  (SELECT DC.customer_code, DC.customer,AVG(FP.pre_invoice_discount_pct) AS average_discount_percentage,FP.fiscal_year,dc.market
   FROM  fact_pre_invoice_deductions  FP
    JOIN dim_customer  DC
   ON FP.customer_code = DC.customer_code
  WHERE dc.market = 'India' AND fp.fiscal_year= '2021'
	 GROUP BY DC.customer_code,DC.customer,FP.pre_invoice_discount_pct,FP.fiscal_year,dc.market
	ORDER BY average_discount_percentage DESC
	LIMIT 5)X