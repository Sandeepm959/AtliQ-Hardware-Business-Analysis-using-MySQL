-- Region wise % net sales breakdown by customers in a respective region so that regional analysis on financial analysis can be performed
WITH cte1 as (
SELECT region, customer, sum(net_sales) as total_net_sales
FROM net_sales s JOIN dim_customer c ON s.customer_code=c.customer_code
WHERE s.fiscal_year=2021
GROUP BY region, customer
)
select *, ROUND(100*total_net_sales/sum(total_net_sales) over(partition by region),2) AS net_sales_pct_by_region  from cte1
ORDER BY region;