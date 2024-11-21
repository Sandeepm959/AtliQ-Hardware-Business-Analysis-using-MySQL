-- Top market, top products, top customers by Net Sales(Millions) for a given financial year

-- Top Market (net_sales view is used here)
SELECT market, ROUND(SUM(net_sales)/1000000,2) AS net_sales_mil
FROM net_sales
WHERE fiscal_year=2021
GROUP BY market
ORDER BY net_sales_mil DESC
LIMIT 5;

-- Top Products (net_sales view is used here)
SELECT product, ROUND(SUM(net_sales)/1000000,2) AS net_sales_mil
FROM net_sales
WHERE fiscal_year=2021
GROUP BY product
ORDER BY net_sales_mil DESC
LIMIT 5;

-- Top Customer (net_sales view is used here)
SELECT c.customer, ROUND(SUM(s.net_sales)/1000000,2) AS net_sales_mil
FROM net_sales s JOIN dim_customer c ON s.customer_code=c.customer_code
WHERE fiscal_year=2021
GROUP BY c.customer
ORDER BY net_sales_mil DESC
LIMIT 5;