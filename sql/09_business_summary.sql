
-- FINAL BUSINESS SUMMARY


SELECT
    COUNT(*) AS total_skus,

    COUNT(DISTINCT name) AS unique_products,

    COUNT(DISTINCT category) AS total_categories,

    COUNT(*) FILTER (
        WHERE outofstock = TRUE
    ) AS out_of_stock_products,

    COUNT(*) FILTER (
        WHERE outofstock = FALSE
    ) AS in_stock_products,

    ROUND(AVG(discountpercent), 2) AS average_discount,

    ROUND(AVG(mrp), 2) AS average_mrp,

    ROUND(AVG(discountedsellingprice), 2)
        AS average_selling_price,

    ROUND(
        SUM(discountedsellingprice * availablequantity), 2
    ) AS total_inventory_selling_value,

    SUM(weightingms * availablequantity)
        AS total_inventory_weight_gms

FROM zepto;
