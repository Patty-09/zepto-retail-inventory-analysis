
--  CREATE SQL VIEWS

-- 1. Category inventory summary

CREATE OR REPLACE VIEW category_inventory_summary AS
SELECT
    category,
    COUNT(*) AS total_skus,
    SUM(availablequantity) AS total_available_units,
    ROUND(
        SUM(discountedsellingprice * availablequantity), 2
    ) AS inventory_selling_value,
    ROUND(AVG(discountpercent), 2) AS average_discount
FROM zepto
GROUP BY category;


-- 2. Product pricing analysis

CREATE OR REPLACE VIEW product_pricing_analysis AS
SELECT
    sku_id,
    name,
    category,
    mrp,
    discountedsellingprice,
    discountpercent,
    ROUND(mrp - discountedsellingprice, 2) AS discount_amount
FROM zepto;


-- 3. Inventory status analysis

CREATE OR REPLACE VIEW product_inventory_status AS
SELECT
    sku_id,
    name,
    category,
    availablequantity,
    outofstock,

    CASE
        WHEN outofstock = TRUE THEN 'Out of Stock'
        WHEN availablequantity <= 5 THEN 'Critical'
        WHEN availablequantity <= 20 THEN 'Low Stock'
        ELSE 'Healthy Stock'
    END AS inventory_status

FROM zepto;


-- 4. Test the views

SELECT *
FROM category_inventory_summary;

SELECT *
FROM product_pricing_analysis
LIMIT 20;

SELECT *
FROM product_inventory_status;
