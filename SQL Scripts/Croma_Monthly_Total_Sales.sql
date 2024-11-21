-- As a product owner, I need an aggregate monthly gross sales report for Croma India customers to track how much sales 
-- this particular customer generates from AtliQ and manage our relationship accordingly.
-- Month
-- Total gross sales amount to Croma India in this month.

 


-- Practice Excercise Question
-- Generate a yearly report for Croma India where there are two columns
-- FY, Total Gross Sales amount in that year

select get_fy(s.date) as fiscal_year, round(sum(g.gross_price*s.sold_quantity),2) as gross_price_total
from fact_sales_monthly s join fact_gross_price g on s.product_code=g.product_code and get_fy(s.date)=g.fiscal_year
where s.customer_code=90002002
group by get_fy(s.date);