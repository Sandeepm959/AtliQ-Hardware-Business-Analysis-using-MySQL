CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `post_invoice_discounts` AS
    SELECT 
        `pre`.`date` AS `date`,
        `pre`.`fiscal_year` AS `fiscal_year`,
        `pre`.`product_code` AS `product_code`,
        `pre`.`product` AS `product`,
        `pre`.`customer_code` AS `customer_code`,
        `pre`.`market` AS `market`,
        `pre`.`variant` AS `variant`,
        `pre`.`sold_quantity` AS `sold_quantity`,
        `pre`.`gross_price` AS `gross_price`,
        `pre`.`total_gross_price` AS `total_gross_price`,
        `pre`.`pre_invoice_discount_pct` AS `pre_invoice_discount_pct`,
        ((1 - `pre`.`pre_invoice_discount_pct`) * `pre`.`total_gross_price`) AS `net_invoice_sales`,
        (`post`.`discounts_pct` + `post`.`other_deductions_pct`) AS `post_invoice_deductions_pct`
    FROM
        (`sales_preinv_discount` `pre`
        JOIN `fact_post_invoice_deductions` `post` ON (((`post`.`customer_code` = `pre`.`customer_code`)
            AND (`post`.`product_code` = `pre`.`product_code`)
            AND (`post`.`date` = `pre`.`date`))))