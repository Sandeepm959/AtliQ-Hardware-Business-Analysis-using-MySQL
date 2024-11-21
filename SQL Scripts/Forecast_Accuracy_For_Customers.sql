-- Get forecast accuracy for customers

WITH forecast_error_table AS
(SELECT *,
(forecast_quantity-sold_quantity) AS net_error,
100*SUM((forecast_quantity-sold_quantity))/SUM(forecast_quantity) AS net_error_pct,
SUM(ABS(forecast_quantity-sold_quantity)) AS abs_error,
100*SUM((ABS(forecast_quantity-sold_quantity)))/SUM(forecast_quantity) AS abs_error_pct
FROM fact_act_est
WHERE fiscal_year=2021
GROUP BY customer_code)

SELECT e.*, c.customer, c.market,
IF(abs_error_pct > 100, 0, 100-abs_error_pct) AS forecast_accuracy
FROM forecast_error_table e JOIN dim_customer c ON e.customer_code=c.customer_code
ORDER BY forecast_accuracy;