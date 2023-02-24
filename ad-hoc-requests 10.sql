QUESTION 10 
--Get the Top 3 products in each division that have a high
--total_sold_quantity in the fiscal_year 2021? The final output contains these
--fields, division, product_code, product, total_sold_quantity, rank_order




  SELECT M.division,M.product_code,M.product,M.sold_quantity,M.rank_order
 FROM
  (SELECT x.*
 FROM
   (SELECT DP.division,F.Product_code,DP.product,F.Fiscal_year,F.sold_quantity,
 ROW_NUMBER () OVER (PARTITION BY division ORDER BY sold_quantity DESC) AS rank_order
 FROM fact_sales_monthly F
 JOIN dim_product DP
 ON F.product_code = dp.product_code
 WHERE f.fiscal_year = '2021'
   )x
   WHERE x.rank_order<= 3)M