Question 9
--Which channel helped to bring more gross sales in the fiscal year 2021
--and the percentage of contribution? The final output contains these fields,
--channel, gross_sales_mln, percentage



SELECT x.channel,x.gross_sales_min, x.gross_sales_min*100/SUM(x.gross_sales_min) OVER () AS Percentage
FROM
  (SELECT DC.channel ,F.Fiscal_year,SUM(FG.gross_price * f.sold_quantity) AS gross_sales_min
  FROM ((Fact_sales_monthly F
  JOIN dim_customer dc
  ON F.Customer_code = DC.customer_code)
  JOIN fact_gross_price FG
  ON F.product_code = FG.product_code)
  WHERE F.fiscal_year = '2021'
  GROUP BY DC.channel,F.Fiscal_year
  ORDER BY gross_sales_min DESC)x
  GROUP BY x.channel,x.gross_sales_min