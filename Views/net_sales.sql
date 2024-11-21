CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `net_sales` AS
    SELECT 
        `post`.`date` AS `date`,
        `post`.`fiscal_year` AS `fiscal_year`,
        `post`.`product_code` AS `product_code`,
        `post`.`product` AS `product`,
        `post`.`customer_code` AS `customer_code`,
        `post`.`market` AS `market`,
        `post`.`variant` AS `variant`,
        `post`.`sold_quantity` AS `sold_quantity`,
        `post`.`gross_price` AS `gross_price`,
        `post`.`total_gross_price` AS `total_gross_price`,
        `post`.`pre_invoice_discount_pct` AS `pre_invoice_discount_pct`,
        `post`.`net_invoice_sales` AS `net_invoice_sales`,
        `post`.`post_invoice_deductions_pct` AS `post_invoice_deductions_pct`,
        ((1 - `post`.`post_invoice_deductions_pct`) * `post`.`net_invoice_sales`) AS `net_sales`
    FROM
        `post_invoice_discounts` `post`