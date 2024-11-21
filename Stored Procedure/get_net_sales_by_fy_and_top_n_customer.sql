CREATE DEFINER=`root`@`localhost` PROCEDURE `get_net_sales_by_fy_and_top_n_customer`(
IN in_fy INT,
IN in_top_customer_count INT
)
BEGIN

SELECT c.customer, ROUND(SUM(s.net_sales)/1000000,2) AS net_sales_mil
FROM net_sales s JOIN dim_customer c ON s.customer_code=c.customer_code
WHERE fiscal_year=in_fy
GROUP BY c.customer
ORDER BY net_sales_mil DESC
LIMIT in_top_customer_count;

END