
QUESTION 5 ANSWER 
  -- Get the products that have the highest and lowest manufacturing costs.
--The final output should contain these fields,
--product_code, product, manufacturing_cost

SELECT M.product, M.manufacturing_cost
 FROM(
 SELECT J.*, ROW_NUMBER() OVER( order by J.manufacturing_cost DESC ) AS NUMBERING
  FROM( 
   SELECT DP.product_code,DP.product,F.manufacturing_cost 
    FROM dim_product DP
    INNER JOIN fact_manufacturing_cost F
    ON DP.product_code = F.product_code 
   	ORDER BY f.manufacturing_cost DESC
	  ) J
	 ) M
 	WHERE M.NUMBERING =1 or M.NUMBERING =579