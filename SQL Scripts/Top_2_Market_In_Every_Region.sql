-- Retrieve the top 2 markets in every region by their gross sales amount in FY=2021.
WITH cte1 AS
(
SELECT c.region, c.market, ROUND(SUM(gs.gross_price_total)/1000000,2) AS gross_sales_mln
FROM dim_customer c JOIN gross_sales gs ON c.customer_code=gs.customer_code
WHERE gs.fiscal_year=2021
GROUP BY c.region, c.market
),
cte2 AS(
SELECT *,
dense_rank() over(PARTITION BY region ORDER BY gross_sales_mln DESC) AS D_Rank 
FROM cte1
)

SELECT * FROM cte2 WHERE D_Rank<=2;