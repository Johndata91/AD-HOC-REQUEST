-- QUESTION 3
--  Provide a report with all the unique product counts for each segment and
--sort them in descending order of product counts. The final output contains 2 fields,
--segment
--product_count

 SELECT COUNT(DISTINCT product),segment
	FROM dim_product
	GROUP BY segment
	ORDER BY COUNT(DISTINCT product) DESC;