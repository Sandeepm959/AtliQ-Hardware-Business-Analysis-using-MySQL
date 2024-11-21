CREATE DEFINER=`root`@`localhost` PROCEDURE `get_top_n_product_per_division_by_qty_sold_and_fy`(
IN in_fy INT,
IN in_top_n INT
)
BEGIN

WITH cte1 AS
(
SELECT p.Division, p.Product, SUM(s.sold_quantity) AS Total_Quantity 
FROM dim_product p JOIN fact_sales_monthly s ON p.product_code=s.product_code
WHERE s.fiscal_year=in_fy
GROUP BY p.division, p.product
),
cte2 AS
(
SELECT *, 
DENSE_RANK() OVER(PARTITION BY Division ORDER BY Total_Quantity DESC) AS D_Rank
FROM cte1
)

SELECT * FROM cte2 WHERE D_Rank<=in_top_n;

END