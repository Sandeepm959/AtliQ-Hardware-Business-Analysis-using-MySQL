-- As a product owner, I want to generate a report of individual product sales (aggregated on a monthly basis at the product code level)
-- for Chroma India customer for FY 2021 so that I can track individual product and run further product analytics on it in excel.
-- Report should have following fields:
-- Month, Product Name, Variant, Sold Qty, Gross price per item, Gross price total

select s.date, s.product_code, p.product, p.variant, s.sold_quantity, round(g.gross_price,2) as gross_price, round(g.gross_price*s.sold_quantity,2) as total_gross_price
from fact_sales_monthly s 
join dim_product p on s.product_code=p.product_code 
join fact_gross_price g on g.product_code=s.product_code and g.fiscal_year=get_fy(s.date)
where customer_code=90002002 and get_fy(date)=2021
order by date asc limit 2000000;