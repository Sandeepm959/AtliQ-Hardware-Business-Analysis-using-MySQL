CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `sales_preinv_discount` AS
    SELECT 
        `s`.`date` AS `date`,
        `s`.`fiscal_year` AS `fiscal_year`,
        `p`.`product_code` AS `product_code`,
        `p`.`product` AS `product`,
        `c`.`customer_code` AS `customer_code`,
        `c`.`market` AS `market`,
        `p`.`variant` AS `variant`,
        `s`.`sold_quantity` AS `sold_quantity`,
        `gp`.`gross_price` AS `gross_price`,
        (`s`.`sold_quantity` * `gp`.`gross_price`) AS `total_gross_price`,
        `pre`.`pre_invoice_discount_pct` AS `pre_invoice_discount_pct`
    FROM
        ((((`fact_sales_monthly` `s`
        JOIN `dim_customer` `c` ON ((`s`.`customer_code` = `c`.`customer_code`)))
        JOIN `dim_product` `p` ON ((`p`.`product_code` = `s`.`product_code`)))
        JOIN `fact_gross_price` `gp` ON (((`p`.`product_code` = `gp`.`product_code`)
            AND (`s`.`fiscal_year` = `gp`.`fiscal_year`))))
        JOIN `fact_pre_invoice_deductions` `pre` ON (((`s`.`customer_code` = `pre`.`customer_code`)
            AND (`pre`.`fiscal_year` = `s`.`fiscal_year`))))