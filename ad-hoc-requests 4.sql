-- QUESTION 4
-- Which segment had the most increase in unique products in
--2021 vs 2020? The final output contains these fields,
--segment, product_count_2020, product_count_2021, difference

 SELECT dp.segment,
    COUNT(DISTINCT CASE WHEN fp.fiscal_year = '2021'THEN dp.product END) AS product_count_2021,
	COUNT(DISTINCT CASE WHEN fp.fiscal_year = '2020'THEN dp.product END) AS product_count_2020,
	COUNT(DISTINCT CASE WHEN fp.fiscal_year = '2021'THEN dp.product END)  - COUNT(DISTINCT CASE WHEN fp.fiscal_year = '2020'THEN dp.product END) AS DIFFERENCE 
	FROM dim_product dp
	JOIN fact_sales_monthly fp
	ON fp.product_code = dp.product_code
	GROUP BY dp.segment