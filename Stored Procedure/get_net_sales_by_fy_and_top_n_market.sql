CREATE DEFINER=`root`@`localhost` PROCEDURE `get_net_sales_by_fy_and_top_n_market`(
IN in_fy INT,
IN in_top_market_count INT 
)
BEGIN

SELECT market, ROUND(SUM(net_sales)/1000000,2) AS net_sales_mil
FROM net_sales
WHERE fiscal_year=in_fy
GROUP BY market
ORDER BY net_sales_mil DESC
LIMIT in_top_market_count;

END