CREATE DEFINER=`root`@`localhost` PROCEDURE `get_monthly_gross_sales_for_customer`(
c_codes text
)
BEGIN

select s.date, round(sum(g.gross_price*s.sold_quantity),2) as gross_price_total
from fact_sales_monthly s join fact_gross_price g on s.product_code=g.product_code and get_fy(s.date)=g.fiscal_year
where find_in_set(s.customer_code, c_codes) 
group by s.date
order by date asc
limit 2000000;

END