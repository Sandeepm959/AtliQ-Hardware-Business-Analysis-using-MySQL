-- Create a store procedure that can determine the market badge by following logic.
-- If the total sold quantity is> 5 million that market is considered Gold else it is Silver
-- My input will be - market, fiscal year
-- Output - market badge

USE `gdb0041`;
DROP procedure IF EXISTS `get_market_badge`;

USE `gdb0041`;
DROP procedure IF EXISTS `gdb0041`.`get_market_badge`;
;

DELIMITER $$
USE `gdb0041`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_market_badge`(
in in_market varchar(40),
in in_fy year,
out out_badge varchar(20)
)
BEGIN
declare qty int default 0;

select sum(s.sold_quantity) into qty from 
dim_customer c join fact_sales_monthly s on c.customer_code=s.customer_code
where get_fy(s.date)=in_fy and c.market=in_market
group by c.market
;

if qty>5000000 then set out_badge="Gold";
else set out_badge ="Silver";
end if;
END$$

DELIMITER ;
;

