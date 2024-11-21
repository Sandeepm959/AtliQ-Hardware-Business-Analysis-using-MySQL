CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `gross_sales` AS
    SELECT 
        `fcm`.`date` AS `date`,
        `fcm`.`fiscal_year` AS `fiscal_year`,
        `dc`.`customer_code` AS `customer_code`,
        `dc`.`customer` AS `customer`,
        `dc`.`market` AS `market`,
        `dp`.`product_code` AS `product_code`,
        `dp`.`product` AS `product`,
        `dp`.`variant` AS `variant`,
        `fcm`.`sold_quantity` AS `sold_quantity`,
        `fgp`.`gross_price` AS `gross_price`,
        (`fcm`.`sold_quantity` * `fgp`.`gross_price`) AS `gross_price_total`
    FROM
        (((`fact_sales_monthly` `fcm`
        JOIN `dim_customer` `dc` ON ((`fcm`.`customer_code` = `dc`.`customer_code`)))
        JOIN `dim_product` `dp` ON ((`dp`.`product_code` = `fcm`.`product_code`)))
        JOIN `fact_gross_price` `fgp` ON (((`fcm`.`product_code` = `fgp`.`product_code`)
            AND (`fcm`.`fiscal_year` = `fgp`.`fiscal_year`))))
