CREATE DEFINER=`root`@`localhost` PROCEDURE `get_net_sales_by_fy_and_top_n_products`(
IN in_fy int,
IN in_top_product_count int
)
BEGIN

SELECT product, ROUND(SUM(net_sales)/1000000,2) AS net_sales_mil
FROM net_sales
WHERE fiscal_year=in_fy
GROUP BY product
ORDER BY net_sales_mil DESC
LIMIT in_top_product_count;

END