-- Get TOP N products of each division by their quantity sold in a given financial year. And also create stored proc

WITH cte1 AS
(
SELECT p.Division, p.Product, SUM(s.sold_quantity) AS Total_Quantity 
FROM dim_product p JOIN fact_sales_monthly s ON p.product_code=s.product_code
WHERE s.fiscal_year=2021
GROUP BY p.division, p.product
),
cte2 AS
(
SELECT *, 
DENSE_RANK() OVER(PARTITION BY Division ORDER BY Total_Quantity DESC) AS D_Rank
FROM cte1
)

SELECT * FROM cte2 WHERE D_Rank<=3;
